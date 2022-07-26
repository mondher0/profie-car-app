import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    Key? key,
    required this.progress,
  }) : super(key: key);

  final double progress;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      color: const Color(0xff0C7995),
      backgroundColor: Colors.black12,
      minHeight: progress == 1 ? 0.1 : 5,
    );
  }
}
