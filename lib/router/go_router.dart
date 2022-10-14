import 'package:ejemplo_gorouter/bloc/auth/auth_bloc.dart';
import 'package:ejemplo_gorouter/page/home_page.dart';
import 'package:ejemplo_gorouter/page/login_page.dart';
import 'package:ejemplo_gorouter/page/view/home_view.dart';
import 'package:ejemplo_gorouter/page/view/login_view.dart';
import 'package:ejemplo_gorouter/page/view/perfil_view.dart';
import 'package:ejemplo_gorouter/utils/reg_exp_utils.dart';
import 'package:ejemplo_gorouter/utils/responsive_wrapper_utils.dart';
import 'package:ejemplo_gorouter/page/view/no_page_found_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Gorouter {
  // Auth Router
  static String login = '/login';
  static String home = '/home';
  static String perfilRedirect = '/perfilRedirect';
  static String perfil = '/perfil';
  static String noPageFound = '/404';

  static GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  GoRouter router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: login,
      errorPageBuilder: (BuildContext context, GoRouterState state) =>
          _transicionPagina(
              child: ResponsiveWrapperUtil.responsiveWidget(
                  const NoPageFoundView())),
      routes: <RouteBase>[
        ShellRoute(
            pageBuilder: (BuildContext context, GoRouterState state, child) {
              return _transicionPagina(
                  child: ResponsiveWrapperUtil.responsiveWidget(
                      LoginPage(child: child)));
            },
            routes: <RouteBase>[
              GoRoute(
                path: login,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    _transicionPagina(child: const LoginView()),
              ),
            ]),
        ShellRoute(
            pageBuilder: (BuildContext context, GoRouterState state, child) =>
                _transicionPagina(
                    child: ResponsiveWrapperUtil.responsiveWidget(
                        HomePage(child: child))),
            routes: <RouteBase>[
              GoRoute(
                path: '/',
                redirect: (_, __) => home,
              ),
              GoRoute(
                  path: home,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return _transicionPagina(child: const HomeView());
                  }),
              GoRoute(path: perfilRedirect, redirect: (_, __) => perfil),
              GoRoute(
                  path: perfil,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return _transicionPagina(child: const PefilView());
                  })
            ])
      ],

      ///Cada vez que se navega a una ruta se accede a este evento donde se captura la ruta y se verifica
      ///si puede visualizar o no dependiendo si se encuentra logeado.
      redirect: (BuildContext context, GoRouterState state) async {
        try {
          final authState = context.read<AuthBloc>().state;

          ///Rutas que son de authPage. Si viene alguna de ellas y no se encuentra logeado se muestra
          ///Si se trata de otra pagina muestra login
          final bool loginRoute = RegExpUtils.verificarSiContiene(
              PosicionTexto.contiene,
              [
                login,
              ],
              state.subloc);

          ///Si no esta logeado y la ruta que viene es una de las mencionadas arriba devuevle null para que no ingrese en un bucle. Si se trata de otra ruta
          ///mostrara login
          if (!authState.isLoggedIn) {
            return loginRoute ? null : login;
          }

          ///Si se quiere acceder a una de las rutas de authPage pero se encuentra logeado muestra la principal de
          ///homePage
          return null;
        } catch (e) {
          return null;
        }
      });

  static Page _transicionPagina({required Widget child}) =>
      CustomTransitionPage<void>(
          child: child,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              FadeTransition(opacity: animation, child: child));
}
