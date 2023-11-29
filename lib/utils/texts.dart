import 'package:flutter/material.dart';

class Texts {
  static bodyMediumBlack(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black);
  static bodyMediumWhite(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white);
  static bodyMediumGrey(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey);
}
