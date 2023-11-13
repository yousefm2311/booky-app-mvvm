// ignore_for_file: library_private_types_in_public_api
import 'package:bookly_full_app_mvvm/features/bubbles_selection/presentition/views/widget/bottom_sheet.dart';
import 'package:bookly_full_app_mvvm/features/bubbles_selection/presentition/views/widget/func_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:bookly_full_app_mvvm/features/bubbles_selection/data/model/model_bubbles.dart';
import 'package:bookly_full_app_mvvm/features/bubbles_selection/presentition/views/widget/bubbles_widget.dart';

class BubbleSelection extends StatefulWidget {
  const BubbleSelection({Key? key}) : super(key: key);
  @override
  _BubbleSelectionState createState() => _BubbleSelectionState();
}

class _BubbleSelectionState extends State<BubbleSelection> {
  List<String> selectedInterests = [];
  Map<String, bool> isSelected = {};
  @override
  Widget build(BuildContext context) {
    List<ModelBubbles> interests = listBubbles(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            for (int index = 0; index < interests.length; index++)
              BubblesWidget(
                isSelected: isSelected[interests[index].text] ?? false,
                onTap: () {
                  toggleInterest(interests[index].text);
                },
                modelBubbles: interests[index],
              ),
          ],
        ),
      ),
      bottomSheet: BottomSheetView(selection: selectedInterests),
    );
  }

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
        isSelected[interest] = false;
      } else {
        selectedInterests.add(interest);
        isSelected[interest] = true;
      }
    });
  }
}
