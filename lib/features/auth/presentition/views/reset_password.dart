import 'package:bookly_full_app_mvvm/core/utils/functions/custom_snack_bar.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/button.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_bloc.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_event.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_state.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AuthBloc>(context);
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => popRouter(context),
              icon: const Icon(
                IconBroken.Arrow___Left_2,
                size: 30,
                color: Colors.black,
              ),
            ),
            title: Text(
              'Reset Password',
              style: Styles.textStyle20
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: bloc.fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50.0),
                  const Icon(IconBroken.Lock, size: 100),
                  const SizedBox(height: 20.0),
                  const Text(
                    'FORGOT\nPASSWORD',
                    style: Styles.textStyle32,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextFormField(
                    hintText: 'email',
                    prefixIcon: const Icon(Icons.email),
                    controller: bloc.resetPasswordController,
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email address required';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomButton(
                      text: state is ResetPasswordLoadingState
                          ? const CustomLoadingIndicator()
                          : Text(
                              'Reset Password',
                              style: Styles.textStyle16.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                      onPressed: () {
                        if (bloc.fromKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context)
                              .add(ResetPasswordEvent());
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is ResetPasswordFailureState) {
          customSnackBar(context, text: state.errorMessage);
        } else if (state is ResetPasswordSuccessState) {
          Future.delayed(const Duration(seconds: 4), () {
            popRouter(context);
          });
        }
      },
    );
  }
}
