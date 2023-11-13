import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/button.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_bloc.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_event.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_state.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/clippath_view.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/section_bottom_view.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/section_continue_with.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/section_register_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterBodyView extends StatelessWidget {
  const RegisterBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<AuthBloc>(context);
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ClipPathView(),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Register', style: Styles.textStyle32)),
              const SizedBox(height: 20.0),
              SectionRegisterTextFormField(
                bloc: bloc,
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButton(
                  text: state is RegisterLoadingState
                      ? const CustomLoadingIndicator()
                      : Text(
                          'Register',
                          style:
                              Styles.textStyle20.copyWith(color: Colors.white),
                        ),
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(RegisterEvent());
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              const SectionContinueWithView(),
              SectionBottomView(
                text: 'Already have an account?',
                buttonTitle: 'Login now',
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRoutes.loginView);
                },
              )
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
