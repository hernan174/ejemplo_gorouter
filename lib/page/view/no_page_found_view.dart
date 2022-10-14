import 'package:flutter/material.dart';

import 'package:ejemplo_gorouter/widget/text_widget.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: TextTituloWidget(texto: '404 - Página no encontrada'),
      ),
    );
  }
}
