import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_labs/helpers/criptografiaHelper.dart';

class CriptografiaView extends StatefulWidget {
  @override
  _CriptografiaViewState createState() => _CriptografiaViewState();
}

class _CriptografiaViewState extends State<CriptografiaView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controladorPrivateKey = TextEditingController();
  final TextEditingController _controladorPublicKey = TextEditingController();
  final TextEditingController _controladorValorKey = TextEditingController();

  final TextStyle keysStyle = TextStyle(fontSize: 10);
  String resultado;

  @override
  void initState() {
    super.initState();
    _controladorPublicKey.text = "-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCw4WEldRrvgB2cFn3W7CIiJuUt\nbRxiwQoI0UkT2GeKIS/cZOSq0tGH4IMc5x7tu0DH4Ezo1OOpeKtlFJYQQbWNfU4v\nPXlFgmqoVUueMDJurXYNpCkASi8y9yaAIVnk49gblzMmc1m0SzEgRnQs9V70tkSx\nUyErNaSj7GjLxBwLqQIDAQAB\n-----END PUBLIC KEY-----\n";
    _controladorPrivateKey.text = "-----BEGIN RSA PRIVATE KEY-----\nMIICXQIBAAKBgQCfR1R0r76s3TwaE2Xi74t3UtmS4k/psppWBdeZh4wpUPm82LJL\nUIPm47Arw7yrqWLRv43Syt7aOe8aKRTRWxATkV/cF0vtNlTkn+LQ8OyCYFYxLX69\nPPE1bXTt/4o0ZtpKma3Kc0Errinwv7fflS04A1eLBKnE5XeuwnxeHYCcjwIDAQAB\nAoGBAIXWbSwjpOgiemc614lKWfmpH3PiQN4Rmsgf3pt+n5L0HPXHbIIGpN81gYo0\nzmu8SHIRML3ohDwBJF3qGTkV+Ln1GpIbbPSon4yXuI2muEGNauXWaS/V3PghcTGw\nAU9iNgLbB4LIvgfID1vv/KU98id9LazaTJbv7mtiwHhaChuxAkEAz2pcL1sJVjvU\n3YmcfvbYd+SYl7rV+B2pTmfldfDFvrRy2PJfnSsVZ3mTkIX78pP6GE7M5TRouRxP\n5VtJO2EpqQJBAMSWc3iBodCBUTdpY9QGUGrIQsSxozAurRVaKNhaa/oMCZduZMcf\neGfITz3C4HnWOyCYiop3EdaB6VyzK+uBp3cCQEvyeRDJ99BAlkAMTGZdAoRcCte8\nDO8OBVl1R5r4759VuZvgm8wT44GBDdxkgw2ey3utFu9yUko9qK+lzlnUyQkCQQCx\nG6ZuI8PHmCm2VUF1zDZ47XCRykPt7a9LtE1mFZh/zoZ5oiAy8NxGC8WwK7iWq3Xb\nePIfqwQsECBQvq7L3qQjAkAhLR9EGKTVEBFIYfoeaIKuplJOo89oQRSvwEcMc6/J\nzFzJVHPHsl/1Ro9CbZaMN0QB4anlnkW1RPI9FWN8wEKv\n-----END RSA PRIVATE KEY-----\n";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Criptografia"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(controller: _controladorPrivateKey, maxLines: 10, decoration: InputDecoration(labelText: "Private Key"), style: keysStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(controller: _controladorPublicKey, maxLines: 8, decoration: InputDecoration(labelText: "Public Key"), style: keysStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(controller: _controladorValorKey, maxLines: 2, decoration: InputDecoration(labelText: "Valor"), style: keysStyle),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text("Criptografar"),
                    color: Colors.blue,
                    onPressed: () async {
                      resultado = CriptografiaHelperSingleton.instancia.criptografarRSA(_controladorValorKey.text, _controladorPublicKey.text);
                      setState(() {});
                    },
                  ),
                  SizedBox(width: 20),
                  RaisedButton(
                    child: Text("Descriptografar"),
                    color: Colors.red,
                    onPressed: () {
                      resultado = CriptografiaHelperSingleton.instancia.descriptografarRSA(_controladorValorKey.text, _controladorPrivateKey.text);
                      setState(() {});
                    },
                  ),
                ],
              ),
              Center(child: Padding(padding: const EdgeInsets.only(top: 40, bottom: 10), child: Text("Resultado", style: TextStyle(fontWeight: FontWeight.bold)))),
              Row(
                children: [
                  Expanded(child: Padding(padding: const EdgeInsets.only(right: 20), child: Text(resultado ?? ""))),
                  resultado?.isEmpty == false
                      ? RaisedButton(
                          child: Text("Copiar"),
                          onPressed: () async {
                            await Clipboard.setData(ClipboardData(text: resultado ?? ""));
                            final snackBar = SnackBar(content: Text("Copiado para a área de transferência"), backgroundColor: Colors.blue);
                            _scaffoldKey.currentState.showSnackBar(snackBar);
                          },
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
