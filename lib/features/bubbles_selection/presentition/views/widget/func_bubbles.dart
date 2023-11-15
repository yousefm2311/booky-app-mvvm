import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/features/bubbles_selection/data/model/model_bubbles.dart';
import 'package:flutter/material.dart';

List<ModelBubbles> listBubbles(context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  List<ModelBubbles> interests = [
    ModelBubbles(
        color: AppColors.kColor_2,
        text: 'Literature',
        top: height * .314,
        left: width * .07,
        width: width * .21,
        height: width * .21),
    ModelBubbles(
        color: AppColors.kColor_5,
        text: 'Science',
        top: height * .28,
        left: width * .35,
        width: width * .33,
        height: width * .33),
    ModelBubbles(
        color: AppColors.kColor_4,
        text: 'History',
        top: height * .311,
        left: width * .76,
        width: width * .23,
        height: width * .23),
    ModelBubbles(
        color: AppColors.kColor_1,
        text: 'Biographies',
        top: height * .13,
        left: width * .12,
        width: width * .33,
        height: width * .33),
    ModelBubbles(
        color: AppColors.kColor_2,
        text: 'Philosophy',
        top: height * .15,
        left: width * .59,
        width: width * .3,
        height: width * .3),
    ModelBubbles(
        color: AppColors.kColor_1,
        text: 'Religion',
        top: height * .448,
        left: width * .54,
        width: width * .27,
        height: width * .27),
    ModelBubbles(
        color: AppColors.kColor_4,
        text: 'Computer Science',
        top: height * .44,
        left: width * .03,
        width: width * .4,
        height: width * .4),
    ModelBubbles(
        color: AppColors.kColor_2,
        text: 'Economics',
        top: height * .61,
        left: width * .499,
        width: width * .35,
        height: width * .35),
    ModelBubbles(
        color: AppColors.kColor_1,
        text: 'Politics',
        top: height * .7,
        left: width * .3,
        width: width * .18,
        height: width * .18),
    ModelBubbles(
        color: AppColors.kColor_3,
        text: 'Self-Help',
        top: height * .65,
        left: width * .01,
        width: width * .26,
        height: width * .26),
    ModelBubbles(
        color: AppColors.kColor_1,
        text: 'Education',
        top: height * .02,
        left: width * .72,
        width: width * .23,
        height: width * .23),
    ModelBubbles(
        color: AppColors.kColor_5,
        text: 'Business',
        top: height * .55,
        left: width * .79,
        width: width * .18,
        height: width * .18),
    ModelBubbles(
        color: AppColors.kColor_5,
        text: 'Programming',
        top: height * .02,
        left: width * .4,
        width: width * .28,
        height: width * .28),
    ModelBubbles(
        color: AppColors.kColor_3,
        text: 'Health',
        top: height * .01,
        left: width * .18,
        width: width * .18,
        height: width * .18),
    ModelBubbles(
        color: AppColors.kColor_5,
        text: 'Arts',
        top: height * .079,
        left: width * .04,
        width: width * .12,
        height: width * .12),
  ];
  return interests;
}
