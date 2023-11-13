import 'package:bookly_full_app_mvvm/core/utils/functions/save_to_fire_base.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/firestore_services.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/repos/auth_repo.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_event.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool isVisibility = true;
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController nameRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();

  final AuthRepo authRepo;
  AuthBloc(this.authRepo) : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      // Change Visibility Event
      if (event is ChangeVisibilityEvent) {
        isVisibility = !isVisibility;
        emit(ChangeVisibilityState());
      }
      // Login Event
      else if (event is LoginEvent) {
        emit(LoginLoadingState());
        var result = await authRepo.loginMethod(
            email: emailLoginController.text,
            password: passwordLoginController.text);
        result.fold((failure) {
          emit(LoginFailureState(errorMessage: failure.errorMessage));
        }, (value) {
          FireStoreUser()
              .getUserDataFromFirebase(value.user!.uid)
              .then((value) {
            debugPrint(value.toString());
          });
          emit(LoginSuccessState());
        });
      }
      // Register Event
      else if (event is RegisterEvent) {
        emit(RegisterLoadingState());
        var result = await authRepo.registerMethod(
            email: emailRegisterController.text,
            password: passwordRegisterController.text);
        result.fold((failure) {
          emit(RegisterFailureState(errorMessage: failure.errorMessage));
        }, (value) {
          saveToFireStore(value, nameRegisterController);
          emit(RegisterSuccessState());
        });
      }
    });
  }
}
