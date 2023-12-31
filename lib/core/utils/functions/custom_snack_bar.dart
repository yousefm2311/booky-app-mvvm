import 'package:flutter/material.dart';

void customSnackBar(context, {required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
