import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/components/button.dart';
import 'package:test/components/privacy_policy.dart';
import 'package:test/components/text_form_field.dart';
import 'package:test/utils/texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  RegExp atLeast2Chars = RegExp(r'^.{2,}$');
  RegExp onlyaZ09 = RegExp(r'^[a-zA-Z0-9 ]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Center(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    Text('Usuário', style: Texts.bodyMediumWhite(context)),
                    const SizedBox(height: 10),
                    userField(),
                    const SizedBox(height: 30),
                    Text('Senha', style: Texts.bodyMediumWhite(context)),
                    const SizedBox(height: 10),
                    passwordField(),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                          text: 'Entrar',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/data', (route) => false);
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: PrivacyPolicy(),
          )
        ],
      ),
    );
  }

  userField() {
    return CustomTextFormField(
      prefixIcon: CupertinoIcons.person_fill,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obrigatório';
        }
        if (value.endsWith(' ')) {
          return 'O usuário não pode terminar com um espaçamento';
        }
        return null;
      },
    );
  }

  passwordField() {
    return CustomTextFormField(
      prefixIcon: CupertinoIcons.lock_fill,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obrigatório';
        }
        if (!atLeast2Chars.hasMatch(value)) {
          return 'A senha deve conter no mínimo 2 caracteres';
        }
        if (!onlyaZ09.hasMatch(value)) {
          return 'A senha não pode conter caracteres especiais';
        }
        if (value.endsWith(' ')) {
          return 'A senha não pode terminar com um espaçamento';
        }

        return null;
      },
    );
  }
}
