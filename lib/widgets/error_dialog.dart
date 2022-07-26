import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'custom_button.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      title: const Text('Pas de connexion Internet'),
      content: const Text(
          "S'il vous plaît, vérifiez votre connexion internet et réessayez"),
      actions: [
        CustomButton(
          onPressed: () =>
              SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
          text: 'Quitter',
          color: const Color(0xffF3665A),
        ),
        CustomButton(
          onPressed: () {
            Navigator.of(context).pop();
            controller.reload();
          },
          text: 'Actualiser',
        ),
      ],
    );
  }
}
