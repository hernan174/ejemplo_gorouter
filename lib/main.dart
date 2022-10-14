import 'package:ejemplo_gorouter/bloc/auth/auth_bloc.dart';
import 'package:ejemplo_gorouter/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = Gorouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthBloc())],
      child: MaterialApp.router(
        title: 'Ejemplo Go Router',
        routeInformationParser: _router.router.routeInformationParser,
        routerDelegate: _router.router.routerDelegate,
        routeInformationProvider: _router.router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
