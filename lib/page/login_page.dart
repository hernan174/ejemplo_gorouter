import 'package:ejemplo_gorouter/bloc/auth/auth_bloc.dart';
import 'package:ejemplo_gorouter/page/global/environment.dart';
import 'package:ejemplo_gorouter/router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:ejemplo_gorouter/widget/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        title: TextModelWidget.titulo(
          texto: 'Login Page',
          tipoFuente: FontWeight.w300,
          tamanioTexto: 12,
        ),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.accion == Environment.blocOnLoginAuth) {
            context.go(Gorouter.home);
          }
        },
        child: widget.child,
      ),
    );
  }
}
