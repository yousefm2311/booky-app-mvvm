import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_bloc.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_event.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionTextFormField extends StatelessWidget {
  const SectionTextFormField({super.key, required this.cubit});
  final AuthBloc cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            obscureText: false,
            controller: cubit.emailController,
            hintText: 'email',
            prefixIcon: const Icon(Icons.email_outlined)),
        const SizedBox(height: 20.0),
        CustomTextFormField(
          obscureText: cubit.isVisibility,
          controller: cubit.passwordController,
          hintText: 'password',
          prefixIcon: const Icon(IconBroken.Lock),
          suffixIcon: IconButton(
            icon: cubit.isVisibility
                ? const Icon(Icons.visibility_outlined)
                : const Icon(Icons.visibility_off_outlined),
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(ChangeVisibilityEvent());
            },
          ),
        ),
      ],
    );
  }
}
