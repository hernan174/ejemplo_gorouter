import 'package:ejemplo_gorouter/router/go_router.dart';
import 'package:ejemplo_gorouter/widget/button_widget.dart';
import 'package:ejemplo_gorouter/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PefilView extends StatelessWidget {
  const PefilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextModelWidget.texto(texto: 'Perfil view'),
        ButtonModeWidget.botonSimple(
            titulo: 'Inicio',
            onPressed: () {
              context.go(Gorouter.home);
            })
      ],
    );
  }
}
