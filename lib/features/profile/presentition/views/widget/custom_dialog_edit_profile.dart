import 'dart:io';
import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/custom_snack_bar.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/button.dart';
import 'package:bookly_full_app_mvvm/core/widgets/text_form_field.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view_model/profile_bloc/profile_bloc.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view_model/profile_bloc/profile_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:image_picker/image_picker.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    super.key,
    required this.bloc,
    required this.authModel,
  });

  final ProfileBloc bloc;
  final AuthModel authModel;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return GiffyDialog(
      giffy: Form(
        key: widget.bloc.fromKey,
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await imagePicker();
              },
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: widget.bloc.image == null
                          ? null
                          : DecorationImage(
                              image: FileImage(widget.bloc.image!)),
                      color: AppColors.kGreyColor,
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 25,
                    decoration: const BoxDecoration(),
                    child: const Icon(IconBroken.Edit),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormFieldWidget(
              hintText: 'name',
              prefixIcon: const Icon(IconBroken.Profile),
              controller: widget.bloc.nameController,
              obscureText: false,
              textInputType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            TextFormFieldWidget(
                hintText: 'Bio',
                prefixIcon: const Icon(CupertinoIcons.person_add),
                controller: widget.bloc.bioController,
                obscureText: false,
                textInputType: TextInputType.name,
                validator: (value) {
                  return null;
                }),
            const SizedBox(height: 20.0),
            CustomButton(
              text: Text('Save',
                  style: Styles.textStyle16.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: () async {
                widget.bloc.add(
                  UpdateProfileEvent(authModel: widget.authModel, context),
                );
                popRouter(context);
                customSnackBar(context, text: 'updated successfully');
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> imagePicker() async {
    final pickerFile =
        await widget.bloc.picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      setState(() {
        widget.bloc.image = File(pickerFile.path);
      });
    } else {
      debugPrint("No image selected");
    }
  }
}
