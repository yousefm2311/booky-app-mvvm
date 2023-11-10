import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_bloc.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_state.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/clippath_view.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/section_bottom_view.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/section_continue_with.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/section_button_login.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/section_login_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthBloc>(context);
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ClipPathView(),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Login', style: Styles.textStyle32)),
              const SizedBox(height: 20.0),
              SectionLoginTextFormField(bloc: cubit),
              const SectionButtonLogin(),
              const SizedBox(height: 20.0),
              SectionContinueWithView(onTap: () {}),
              const SizedBox(height: 10.0),
              SectionBottomView(
                text: 'Not a member?',
                buttonTitle: 'Register now',
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.registerView);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
