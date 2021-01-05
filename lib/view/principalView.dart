import 'package:flutter/material.dart';
import 'package:flutter_labs/view/overlay/overlayPrincipalView.dart';

class PrincipalView extends StatefulWidget {
  @override
  _PrincipalViewState createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  OverlayEntry overlayView;
  OverlayEntry overlayWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Labs"), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Overlay"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OverlayPrincipalView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
