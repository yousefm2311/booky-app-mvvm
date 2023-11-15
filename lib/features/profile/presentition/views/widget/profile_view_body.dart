import 'package:bookly_full_app_mvvm/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_full_app_mvvm/core/widgets/error_widget.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view_model/profile_bloc/profile_bloc.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view_model/profile_bloc/profile_state.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/views/widget/profile_items_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is GetProfileDataSuccessState) {
          return ProfileItemsView(
            authModel: state.authModel,
            bloc: BlocProvider.of<ProfileBloc>(context),
          );
        } else if (state is GetProfileDataFailureState) {
          return ErrorDemoWidget(error: state.errorMessage.toString());
        } else {
          return const CustomLoadingIndicator(color: Colors.black);
        }
      },
    );
  }
}
