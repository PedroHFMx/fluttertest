import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async => await launchUrlString('https://google.com.br'),
        child: const Text('Política de Privacidade'));
  }
}
