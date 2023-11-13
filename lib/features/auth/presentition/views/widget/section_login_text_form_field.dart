import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_bloc.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_event.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionLoginTextFormField extends StatelessWidget {
  const SectionLoginTextFormField({super.key, required this.bloc});
  final AuthBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'email address is required';
              }
              return null;
            },
            textInputType: TextInputType.emailAddress,
            obscureText: false,
            controller: bloc.emailLoginController,
            hintText: 'email',
            prefixIcon: const Icon(Icons.email_outlined)),
        const SizedBox(height: 20.0),
        CustomTextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'password is required';
            }
            return null;
          },
          textInputType: TextInputType.visiblePassword,
          obscureText: bloc.isVisibility,
          controller: bloc.passwordLoginController,
          hintText: 'password',
          prefixIcon: const Icon(IconBroken.Lock),
          suffixIcon: IconButton(
            icon: bloc.isVisibility
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
