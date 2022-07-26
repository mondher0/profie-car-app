import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_button.dart';

class QuitDialog extends StatelessWidget {
  const QuitDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      title: const Text('Quitter?'),
      content: const Text('Voulez-vous vraiment quitter cette application?'),
      actions: [
        CustomButton(
          text: 'Quitter',
          color: const Color(0xffF3665A),
          onPressed: () =>
              SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        ),
        const SizedBox(width: 3),
        CustomButton(
          text: 'Annuler',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
