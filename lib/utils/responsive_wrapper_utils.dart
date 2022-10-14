import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

extension ResponsiveWrapperUtil on BuildContext {
  bool mostrarCuando({
    bool? desktop,
    bool? tablet,
    bool? mobile,
    bool? phone,
  }) {
    bool defecto = false;
    if (ResponsiveWrapper.of(this).isPhone) {
      return phone ?? defecto;
    }
    if (ResponsiveWrapper.of(this).isMobile) {
      return mobile ?? defecto;
    }
    if (ResponsiveWrapper.of(this).isTablet) {
      return tablet ?? defecto;
    }
    if (ResponsiveWrapper.of(this).isDesktop) {
      return desktop ?? defecto;
    }

    return defecto;
  }

  double tamanoParaDispositivo({
    required double desktop,
    double? tablet,
    double? mobile,
    double? phone,
  }) {
    double defecto = desktop;
    if (ResponsiveWrapper.of(this).isPhone) {
      return phone ?? mobile ?? tablet ?? desktop;
    }
    if (ResponsiveWrapper.of(this).isMobile) {
      return mobile ?? tablet ?? desktop;
    }
    if (ResponsiveWrapper.of(this).isTablet) {
      return tablet ?? desktop;
    }
    if (ResponsiveWrapper.of(this).isDesktop) {
      return desktop;
    }

    return defecto;
  }

  Widget widgetParaDispositivo({
    required Widget desktop,
    Widget? tablet,
    Widget? mobile,
    Widget? phone,
  }) {
    Widget defecto = desktop;
    if (ResponsiveWrapper.of(this).isPhone) {
      return phone ?? mobile ?? tablet ?? desktop;
    }
    if (ResponsiveWrapper.of(this).isMobile) {
      return mobile ?? tablet ?? desktop;
    }
    if (ResponsiveWrapper.of(this).isTablet) {
      return tablet ?? desktop;
    }
    if (ResponsiveWrapper.of(this).isDesktop) {
      return desktop;
    }

    return defecto;
  }

  T determinarParaPantalla<T>({
    BuildContext? context,
    required T desktop,
    T? tablet,
    T? mobile,
    T? phone,
  }) {
    T defecto = desktop;
    if (ResponsiveWrapper.of(context ?? this).isPhone) {
      return phone ?? mobile ?? tablet ?? desktop;
    }
    if (ResponsiveWrapper.of(context ?? this).isMobile) {
      return mobile ?? tablet ?? desktop;
    }
    if (ResponsiveWrapper.of(context ?? this).isTablet) {
      return tablet ?? desktop;
    }
    if (ResponsiveWrapper.of(context ?? this).isDesktop) {
      return desktop;
    }

    return defecto;
  }

  ///Este metodo es utilizado para determinar el tamaño de pantalla sin utilizar el contexto
  ///ya que no se puede obtener dentro del archivo de [BlocsListeners]
  String determinarTamanio({required double maxWidth}) {
    num desktop = 1200.00;
    num tablet = 780;
    num phone = 260;
    if (maxWidth > desktop) {
      return 'DESKTOP';
    } else if (maxWidth > tablet && maxWidth < desktop) {
      return 'TABLET';
    } else if (maxWidth > phone && maxWidth < tablet) {
      return 'PHONE';
    } else {
      return 'MOBILE';
    }
  }

  static responsiveWidget(Widget child) {
    return ResponsiveWrapper.builder(
        maxWidth: 1200,
        minWidth: 250,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(260, name: PHONE),
          const ResponsiveBreakpoint.autoScale(500, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(780, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
        ],
        child);
  }
}
