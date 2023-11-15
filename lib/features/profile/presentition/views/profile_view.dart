import 'package:bookly_full_app_mvvm/core/utils/services/services_locator.dart';
import 'package:bookly_full_app_mvvm/features/profile/data/repos/profile_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view_model/profile_bloc/profile_bloc.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view_model/profile_bloc/profile_event.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/views/widget/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc(getIt.get<ProfileRepoImpl>())..add(GetProfileDataEvent()),
      child: const ProfileViewBody(),
    );
  }
}
