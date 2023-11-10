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

  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      if (event is ChangeVisibilityEvent) {
        isVisibility = !isVisibility;
        debugPrint('true');
        emit(ChangeVisibilityState());
      }
    });
  }
}
