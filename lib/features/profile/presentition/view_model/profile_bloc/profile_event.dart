// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';

abstract class ProfileEvent {}

class GetProfileDataEvent extends ProfileEvent {}

class LogOutEvent extends ProfileEvent {
  final context;

  LogOutEvent({required this.context});
}

class UpdateProfileEvent extends ProfileEvent {
  final AuthModel authModel;
  final context;

  UpdateProfileEvent(this.context, {required this.authModel});
}
