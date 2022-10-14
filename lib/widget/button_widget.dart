import 'package:ejemplo_gorouter/page/global/theme.dart';
import 'package:ejemplo_gorouter/utils/responsive_wrapper_utils.dart';
import 'package:ejemplo_gorouter/utils/size.dart';
import 'package:ejemplo_gorouter/widget/animations/opacity_animation.dart';
import 'package:ejemplo_gorouter/widget/animations/slide_animation.dart';
import 'package:ejemplo_gorouter/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonModeWidget extends StatelessWidget {
  const ButtonModeWidget(
      {Key? key,
      required this.child,
      this.onPressed,
      required this.padding,
      required this.style,
      this.focusNode})
      : super(key: key);

  final Widget child;
  final Function()? onPressed;
  final EdgeInsets? padding;
  final ButtonStyle style;
  final FocusNode? focusNode;

  factory ButtonModeWidget.botonSimple(
      {Key key,
      required String titulo,
      EdgeInsets? padding,
      required Function() onPressed,
      double? tamanioTexto,
      ButtonStyle? style}) = _CustomButtonSimple;
  factory ButtonModeWidget.botonSinBackground(
      {Key key,
      required String titulo,
      EdgeInsets? padding,
      ButtonStyle? style,
      Color? colorTexto,
      IconData? icono,
      double? tamanioTexto,
      required Function() onPressed,
      FocusNode? focusNode}) = _CustomButtonSinBackground;

  factory ButtonModeWidget.tabConContador(
      {Key key,
      required String titulo,
      EdgeInsets? padding,
      ButtonStyle? style,
      Color? colorTexto,
      int? contador,
      required Function() onPressed}) = _CustomButtonTabContador;

  ///Este boton es para el apartado de login donde aparece el boton de registrarme e iniciar sesion
  factory ButtonModeWidget.botonSeleccionado(
      {Key key,
      required String titulo,
      Function()? onPressed,
      Color? colorTexto,
      ButtonStyle? style}) = _CustomButtonRegistroLogin;

  factory ButtonModeWidget.togleButton(
      {Key key,
      required String titulo,
      Function()? onPressed,
      required bool seleccionado}) = _CustomButtonToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      constraints: BoxConstraints(
        maxHeight: context.alto * 100,
        maxWidth: context.ancho * 100,
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: style,
          focusNode: focusNode,
          child: child),
    );
  }
}

class _CustomButtonSimple extends ButtonModeWidget {
  _CustomButtonSimple({
    super.key,
    required String titulo,
    super.onPressed,
    EdgeInsets? padding,
    ButtonStyle? style,
    double? tamanioTexto,
  }) : super(
            child: _CustomChildButtonSimple(
                titulo: titulo, tamanioTexto: tamanioTexto),
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            style: style ?? const ButtonStyle());
}

class _CustomChildButtonSimple extends StatelessWidget {
  const _CustomChildButtonSimple(
      {Key? key, required this.titulo, this.tamanioTexto})
      : super(key: key);
  final String titulo;
  final double? tamanioTexto;
  @override
  Widget build(BuildContext context) {
    return TextModelWidget.titulo(
      colorTexto: Colors.white,
      tipoFuente: FontWeight.w600,
      tamanioTexto: tamanioTexto ??
          context.tamanoParaDispositivo(
              desktop: tamanoTexto2, phone: tamanoTexto2),
      texto: titulo,
    );
  }
}

class _CustomButtonRegistroLogin extends ButtonModeWidget {
  _CustomButtonRegistroLogin(
      {super.key,
      required String titulo,
      Function()? onPressed,
      Color? colorTexto,
      ButtonStyle? style})
      : super(
          child: _CustomChildButonSeleccionado(
            titulo: titulo,
            colorTexto: colorTexto,
          ),
          style: style ??
              ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0)),
          padding: EdgeInsets.zero,
          onPressed: onPressed,
        );
}

class _CustomChildButonSeleccionado extends StatelessWidget {
  const _CustomChildButonSeleccionado({
    Key? key,
    required this.titulo,
    this.colorTexto,
  }) : super(key: key);
  final String titulo;
  final Color? colorTexto;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Theme.of(context).primaryColor))),
        child: TextModelWidget.titulo(
          texto: titulo,
          colorTexto: colorTexto ?? Theme.of(context).primaryColor,
        ),
      )
    ]);
  }
}

class _CustomButtonSinBackground extends ButtonModeWidget {
  _CustomButtonSinBackground(
      {super.key,
      required String titulo,
      super.onPressed,
      EdgeInsets? padding,
      Color? colorTexto,
      IconData? icono,
      double? tamanioTexto,
      ButtonStyle? style,
      FocusNode? focusNode})
      : super(
            child: _CustomChildButtonSinBackground(
                tamanioTexto: tamanioTexto,
                icono: icono,
                titulo: titulo,
                colorTexto: colorTexto),
            focusNode: focusNode,
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            style: style ??
                ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    elevation: MaterialStateProperty.all<double>(0)));
}

class _CustomChildButtonSinBackground extends StatelessWidget {
  const _CustomChildButtonSinBackground(
      {Key? key,
      required this.titulo,
      this.colorTexto,
      this.icono,
      this.tamanioTexto})
      : super(key: key);
  final String titulo;
  final Color? colorTexto;
  final IconData? icono;
  final double? tamanioTexto;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icono != null)
          Icon(icono,
              size: 15,
              color:
                  colorTexto ?? Theme.of(context).textTheme.headline4!.color!),
        TextModelWidget.titulo(
          colorTexto:
              colorTexto ?? Theme.of(context).textTheme.headline4!.color!,
          tipoFuente: FontWeight.w600,
          tamanioTexto: tamanioTexto ??
              context.tamanoParaDispositivo(
                  desktop: tamanoTexto2, phone: tamanoTexto2),
          texto: titulo,
        ),
      ],
    );
  }
}

class _CustomButtonTabContador extends ButtonModeWidget {
  _CustomButtonTabContador(
      {super.key,
      required String titulo,
      super.onPressed,
      EdgeInsets? padding,
      Color? colorTexto,
      int? contador,
      ButtonStyle? style})
      : super(
            child: Container(
              padding: const EdgeInsets.only(right: 5, bottom: 8.0, left: 5),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: colorTexto ?? Colors.transparent,
                          width: 1.0))),
              child: _CustomChildButtonTabContador(
                  contador: contador, titulo: titulo, colorTexto: colorTexto),
            ),
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            style: style ??
                ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    elevation: MaterialStateProperty.all<double>(0)));
}

class _CustomChildButtonTabContador extends StatelessWidget {
  const _CustomChildButtonTabContador(
      {Key? key, required this.titulo, this.colorTexto, this.contador})
      : super(key: key);
  final String titulo;
  final Color? colorTexto;
  final int? contador;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (contador != null)
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor, shape: BoxShape.circle),
            width: 15,
            height: 15,
            child: Center(
                child: TextModelWidget.texto(
              texto: contador.toString(),
              colorTexto: Colors.white,
            )),
          ),
        TextModelWidget.titulo(
          colorTexto:
              colorTexto ?? Theme.of(context).textTheme.headline4!.color!,
          tipoFuente: FontWeight.w600,
          tamanioTexto: 13,
          texto: ' $titulo',
        ),
      ],
    );
  }
}

class ButtonCancelarConfirmar extends StatelessWidget {
  const ButtonCancelarConfirmar(
      {super.key,
      required this.tituloConfirmar,
      required this.tituloCancelar,
      required this.onPressedConfirma,
      required this.onPressedCancela,
      required this.separacionWidget,
      this.desactivarConfirmar = false});
  final String tituloConfirmar;
  final String tituloCancelar;
  final Function() onPressedConfirma;
  final Function() onPressedCancela;
  final double separacionWidget;
  final bool? desactivarConfirmar;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SlideInLeft(
          child: OpacityAnimation(
            child: ButtonModeWidget.botonSinBackground(
                titulo: tituloCancelar, onPressed: onPressedCancela),
          ),
        ),
        SizedBox(width: separacionWidget),
        SlideInLeft(
          child: OpacityAnimation(
            child: AbsorbPointer(
              absorbing: desactivarConfirmar ?? false,
              child: ButtonModeWidget.botonSimple(
                  style: desactivarConfirmar ?? false
                      ? ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[350]!))
                      : null,
                  titulo: tituloConfirmar,
                  onPressed:
                      desactivarConfirmar ?? false ? () {} : onPressedConfirma),
            ),
          ),
        )
      ],
    );
  }
}

class _CustomButtonToggle extends ButtonModeWidget {
  _CustomButtonToggle(
      {super.key,
      required String titulo,
      Function()? onPressed,
      required bool seleccionado})
      : super(
          child: _CustomChildButonTogle(
              seleccionado: seleccionado,
              titulo: titulo,
              colorTexto: seleccionado ? Colors.blueAccent : Colors.black54),
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.zero),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              elevation: MaterialStateProperty.all<double>(0)),
          padding: EdgeInsets.zero,
          onPressed: onPressed,
        );
}

class _CustomChildButonTogle extends StatelessWidget {
  const _CustomChildButonTogle(
      {Key? key,
      required this.titulo,
      this.colorTexto,
      required this.seleccionado})
      : super(key: key);
  final String titulo;
  final Color? colorTexto;
  final bool seleccionado;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              width: seleccionado ? 2 : 1,
              color: seleccionado
                  ? Theme.of(context).primaryColor
                  : Colors.black54)),
      child: TextModelWidget.texto(
        texto: titulo,
        colorTexto: colorTexto ?? Theme.of(context).primaryColor,
        tipoFuente: seleccionado ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
