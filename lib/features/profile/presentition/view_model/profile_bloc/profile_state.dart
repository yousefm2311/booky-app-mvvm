import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class GetProfileDataLoadingState extends ProfileState {}

class GetProfileDataSuccessState extends ProfileState {
  final AuthModel authModel;

  GetProfileDataSuccessState({required this.authModel});
}

class GetProfileDataFailureState extends ProfileState {
  final String errorMessage;

  GetProfileDataFailureState({required this.errorMessage});
}

class LogOutSuccessState extends ProfileState {}

class UpdateProfileSuccessState extends ProfileState {}

class UpdateProfileFailureState extends ProfileState {
  final String errorMessage;

  UpdateProfileFailureState({required this.errorMessage});
}

class UpdateProfileLoadingState extends ProfileState {}
