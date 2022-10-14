import 'package:ejemplo_gorouter/bloc/auth/auth_bloc.dart';
import 'package:ejemplo_gorouter/widget/button_widget.dart';
import 'package:ejemplo_gorouter/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextModelWidget.texto(texto: 'Login view'),
        ButtonModeWidget.botonSimple(
            titulo: 'Ingresar',
            onPressed: () {
              context.read<AuthBloc>().add(const OnLoginAuth());
            })
      ],
    );
  }
}
