import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_labs/view/overlay/overlayViewQualquer.dart';

class OverlayPrincipalView extends StatefulWidget {
  @override
  _OverlayPrincipalViewState createState() => _OverlayPrincipalViewState();
}

class _OverlayPrincipalViewState extends State<OverlayPrincipalView> {
  OverlayEntry overlayView;
  OverlayEntry overlayWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Overlay"), centerTitle: true),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://tribunaonline.com.br/thumbs/body/2019-07/cerveja-5d32baefa998adfce35c1b5cbec4fdf5.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Overlay Widget"),
              onPressed: () {
                OverlayState overlayState = Overlay.of(context);
                overlayWidget = constroiOverlay(_constroiWidgetQualquer(onPressedBotaoFechar: () => overlayWidget?.remove()));
                overlayState.insert(overlayWidget);
              },
            ),
            RaisedButton(
              child: Text("Abrir view normal"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OverlayViewQualquer(() => Navigator.pop(context))));
              },
            ),
            RaisedButton(
              child: Text("Overlay View"),
              onPressed: () {
                OverlayState overlayState = Overlay.of(context);
                overlayView = constroiOverlay(OverlayViewQualquer(() => overlayView?.remove(), corFundo: Colors.transparent));
                overlayState.insert(overlayView);
              },
            ),
          ],
        ),
      ),
    );
  }

  OverlayEntry constroiOverlay(Widget conteudo) {
    return OverlayEntry(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.55),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: conteudo,
            ),
          ),
        );
      },
    );
  }

  Widget _constroiWidgetQualquer({@required Function onPressedBotaoFechar}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(width: 100, height: 100, color: Colors.red),
        RaisedButton(
          child: Text("Fechar"),
          onPressed: onPressedBotaoFechar,
        ),
      ],
    );
  }
}
