// ignore_for_file: unrelated_type_equality_checks, invalid_use_of_visible_for_testing_member

import 'dart:io';
import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/firestore_services.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';
import 'package:bookly_full_app_mvvm/features/profile/data/repos/profile_repo.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view_model/profile_bloc/profile_event.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view_model/profile_bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo profileRepo;
  var fromKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  File? image;
  var picker = ImagePicker();

  ProfileBloc(this.profileRepo) : super(ProfileInitialState()) {
    var uId = localStorage.getData(key: 'uId');
    on<ProfileEvent>((event, emit) async {
      if (event is GetProfileDataEvent) {
        emit(GetProfileDataLoadingState());
        var result = await profileRepo.fetchProfileData(uId: uId);
        result.fold((failure) {
          emit(GetProfileDataFailureState(errorMessage: failure.errorMessage));
        }, (authModel) {
          nameController.text = authModel.name!;
          bioController.text = authModel.bio!;
          emit(GetProfileDataSuccessState(authModel: authModel));
        });
      } else if (event is LogOutEvent) {
        if (GoogleSignIn() == true) {
          GoogleSignIn().signOut().then((value) {
            localStorage.removeData(key: 'uId');
            emit(LogOutSuccessState());
            pushReplacementRouter(AppRoutes.loginView, event.context);
          });
        } else {
          await auth.signOut().then((value) {
            localStorage.removeData(key: 'uId');
            emit(LogOutSuccessState());
            pushReplacementRouter(AppRoutes.loginView, event.context);
          });
        }
      } else if (event is UpdateProfileEvent) {
        try {
          if (image != null) {
            await firebase_storage.FirebaseStorage.instance
                .ref()
                .child("users/${Uri.file(image!.path).pathSegments.last}")
                .putFile(image!)
                .then((value) {
              value.ref.getDownloadURL().then((data) async {
                AuthModel authModel = AuthModel(
                    bio: bioController.text.isEmpty
                        ? event.authModel.bio
                        : bioController.text,
                    email: event.authModel.email,
                    image: data,
                    name: nameController.text.isEmpty
                        ? event.authModel.name
                        : nameController.text,
                    uId: event.authModel.uId);
                await FireStoreUser()
                    .updateProfile(uId, authModel)
                    .then((value) {
                  add(GetProfileDataEvent());
                });
              });
            });
          } else {
            AuthModel authModel = AuthModel(
                bio: bioController.text.isEmpty
                    ? event.authModel.bio
                    : bioController.text,
                email: event.authModel.email,
                image: event.authModel.image,
                name: nameController.text.isEmpty
                    ? event.authModel.name
                    : nameController.text,
                uId: event.authModel.uId);
            await FireStoreUser().updateProfile(uId, authModel).then((value) {
              add(GetProfileDataEvent());
            });
          }
        } catch (e) {
          emit(UpdateProfileFailureState(errorMessage: e.toString()));
        }
      }
    });
  }
}
