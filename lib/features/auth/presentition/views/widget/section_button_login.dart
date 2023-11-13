import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/core/widgets/button.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_text_button.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_bloc.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionButtonLogin extends StatelessWidget {
  const SectionButtonLogin({super.key, required this.text});

  final Widget text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: CustomTextButton(
              text: 'forgot password?',
              onPressed: () {
                pushRouter(AppRoutes.resetPasswordView, context);
              }),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomButton(
            text: text,
            onPressed: () {
              if (BlocProvider.of<AuthBloc>(context)
                  .fromKey
                  .currentState!
                  .validate()) {
                BlocProvider.of<AuthBloc>(context).add(LoginEvent());
              }
            },
          ),
        )
      ],
    );
  }
}
