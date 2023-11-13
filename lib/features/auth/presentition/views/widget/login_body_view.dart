import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/custom_snack_bar.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_bloc.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_state.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/clippath_view.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/section_bottom_view.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/section_continue_with.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/section_button_login.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/section_login_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is LoginFailureState) {
        customSnackBar(context, text: state.errorMessage.toString());
      } else if (state is LoginSuccessState) {
        localStorage.saveData(
            key: 'uId', value: state.userCredential.user!.uid);
        pushReplacementRouter(AppRoutes.homeView, context);
      }
    }, builder: (context, state) {
      var bloc = BlocProvider.of<AuthBloc>(context);
      return SingleChildScrollView(
        child: Form(
          key: bloc.fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ClipPathView(),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Login', style: Styles.textStyle32)),
              const SizedBox(height: 20.0),
              SectionLoginTextFormField(bloc: bloc),
              SectionButtonLogin(
                text: state is LoginLoadingState
                    ? const CustomLoadingIndicator()
                    : Text(
                        'Login',
                        style: Styles.textStyle20.copyWith(color: Colors.white),
                      ),
              ),
              const SizedBox(height: 20.0),
              SectionContinueWithView(onTap: () {}),
              const SizedBox(height: 10.0),
              SectionBottomView(
                text: 'Not a member?',
                buttonTitle: 'Register now',
                onPressed: () {
                  pushRouter(AppRoutes.registerView, context);
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
