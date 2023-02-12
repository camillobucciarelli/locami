import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  const AppSnackBar._();

  static SnackBar error(BuildContext context, {required String messageKey}) {
    return _buildSnackBar(context, messageKey, _AppSnackBarType.error);
  }

  static SnackBar success(BuildContext context, {required String messageKey}) {
    return _buildSnackBar(context, messageKey, _AppSnackBarType.success);
  }

  static SnackBar _buildSnackBar(
    BuildContext context,
    String messageKey,
    _AppSnackBarType type,
  ) {
    return SnackBar(
      content: Text(messageKey.tr()),
      backgroundColor: type.getColor(context),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      duration: const Duration(seconds: 10),
      dismissDirection: DismissDirection.vertical,
    );
  }
}

enum _AppSnackBarType {
  error,
  success;

  Color getColor(BuildContext context) {
    switch (this) {
      case _AppSnackBarType.error:
        return Theme.of(context).colorScheme.error;
      case _AppSnackBarType.success:
        return Theme.of(context).colorScheme.inversePrimary;
    }
  }
}
