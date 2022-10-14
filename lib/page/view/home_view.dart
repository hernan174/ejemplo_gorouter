import 'package:ejemplo_gorouter/router/go_router.dart';
import 'package:ejemplo_gorouter/widget/button_widget.dart';
import 'package:ejemplo_gorouter/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextModelWidget.texto(texto: 'Home view'),
        const SizedBox(height: 20),
        ButtonModeWidget.botonSimple(
            titulo: 'Perfil',
            onPressed: () {
              context.go(Gorouter.perfilRedirect);
            }),
        const SizedBox(height: 20),
        ButtonModeWidget.botonSimple(
            titulo: 'Salir',
            onPressed: () {
              context.go(Gorouter.login);
            })
      ],
    );
  }
}
