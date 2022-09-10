import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

Future<List<String>?> openTranslationFormDialog(
  BuildContext context, {
  required String title,
  String? key,
  String? value,
}) async {
  return showTextInputDialog(
    context: context,
    title: title,
    barrierDismissible: false,

    textFields: [
      DialogTextField(hintText: 'Key', initialText: key),
      DialogTextField(hintText: 'String', initialText: value),
    ],
  );
}
