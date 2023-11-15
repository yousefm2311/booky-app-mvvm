import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view_model/profile_bloc/profile_bloc.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view_model/profile_bloc/profile_event.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/views/widget/custom_dialog_edit_profile.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/views/widget/container_info.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/views/widget/container_item_profile.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/views/widget/custom_dialog_logout.dart';
import 'package:flutter/material.dart';

class ProfileItemsView extends StatelessWidget {
  const ProfileItemsView({
    super.key,
    required this.authModel,
    required this.bloc,
  });

  final AuthModel authModel;
  final ProfileBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContainerInfo(authModel: authModel),
              const SizedBox(height: 50.0),
              ContainerItemProfile(
                title: 'Edit Profile',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomDialog(
                        bloc: bloc,
                        authModel: authModel,
                      );
                    },
                  );
                },
                icon: IconBroken.Edit,
              ),
              const SizedBox(height: 20.0),
              ContainerItemProfile(
                onTap: () {
                  pushRouter(AppRoutes.bubblesSelectionView, context);
                  pressed = true;
                },
                title: 'Selected Interests',
                icon: IconBroken.Arrow___Right_2,
              ),
              const SizedBox(height: 20.0),
              ContainerItemProfile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialogLogout(
                          onPressed: () {
                            bloc.add(LogOutEvent(context: context));
                          },
                        );
                      },
                    );
                  },
                  title: 'Logout',
                  icon: IconBroken.Logout),
            ],
          ),
        ),
      ),
    );
  }
}
