import 'package:flutter/material.dart';

class OverlayViewQualquer extends StatefulWidget {
  final Function onPressedBotaoFechar;
  final Color corFundo;
  OverlayViewQualquer(this.onPressedBotaoFechar, {this.corFundo});

  @override
  _OverlayViewQualquerState createState() => _OverlayViewQualquerState();
}

class _OverlayViewQualquerState extends State<OverlayViewQualquer> {
  OverlayEntry overlayTeste;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Overlay - View Qualquer"), centerTitle: true),
      backgroundColor: widget.corFundo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80),
            Text("Flutter", style: TextStyle(color: Colors.red)),
            Text("Rapha", style: TextStyle(color: Colors.red)),
            RaisedButton(
              child: Text("Voltar"),
              onPressed: () {
                if (widget.onPressedBotaoFechar != null) widget.onPressedBotaoFechar();
              },
            ),
          ],
        ),
      ),
    );
  }
}
