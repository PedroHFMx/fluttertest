import 'package:flutter/material.dart';
import '../utils/texts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo, fixedSize: const Size(210, 55)),
        onPressed: onPressed,
        child: Text(
          text,
          style: Texts.bodyMediumWhite(context),
        ));
  }
}
