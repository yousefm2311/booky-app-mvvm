abstract class AuthEvent {}

class LoginEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class GoogleAuthEvent extends AuthEvent {}

class ResetPasswordEvent extends AuthEvent {}

class ChangeVisibilityEvent extends AuthEvent {}
