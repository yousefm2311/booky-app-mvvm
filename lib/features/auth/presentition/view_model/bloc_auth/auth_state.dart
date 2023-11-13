import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

// initial state
class AuthInitialState extends AuthState {}

class ChangeVisibilityState extends AuthState {}

// login state
class LoginSuccessState extends AuthState {
  final UserCredential userCredential;

  LoginSuccessState({required this.userCredential});
}

class LoginLoadingState extends AuthState {}

class LoginFailureState extends AuthState {
  final String errorMessage;
  LoginFailureState({required this.errorMessage});
}

// reset state
class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordFailureState extends AuthState {
  final String errorMessage;

  ResetPasswordFailureState({required this.errorMessage});
}

// register state
class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFailureState extends AuthState {
  final String errorMessage;
  RegisterFailureState({required this.errorMessage});
}

// google state
class GoogleLoadingState extends AuthState {}

class GoogleSuccessState extends AuthState {
  final UserCredential userCredential;

  GoogleSuccessState({required this.userCredential});
}

class GoogleFailureState extends AuthState {
  final String errorMessage;

  GoogleFailureState({required this.errorMessage});
}
