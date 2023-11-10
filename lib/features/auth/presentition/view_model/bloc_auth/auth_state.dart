abstract class AuthState {}

class AuthInitialState extends AuthState {}
class ChangeVisibilityState extends AuthState {}
class LoginSuccessState extends AuthState {}
class LoginLoadingState extends AuthState {}
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
