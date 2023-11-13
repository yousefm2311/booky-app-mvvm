import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class ChangeVisibilityState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserCredential userCredential;

  LoginSuccessState({required this.userCredential});
}

class LoginLoadingState extends AuthState {}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordFailureState extends AuthState {
  final String errorMessage;

  ResetPasswordFailureState({required this.errorMessage});
}

class LoginFailureState extends AuthState {
  final String errorMessage;
  LoginFailureState({required this.errorMessage});
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFailureState extends AuthState {
  final String errorMessage;
  RegisterFailureState({required this.errorMessage});
}
