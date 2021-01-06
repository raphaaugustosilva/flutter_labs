import 'package:flutter_labs/services/criptografiaService.dart';

class CriptografiaHelperSingleton {
  CriptografiaHelperSingleton._construtorPrivate();
  static final instancia = CriptografiaHelperSingleton._construtorPrivate();

  String criptografarRSA(String valorRaw, String publicKey) {
    CriptografiaService criptografiaService = CriptografiaService();
    String resultado = criptografiaService.criptografarRSA(valorRaw, publicKey);
    return resultado;
  }

  String descriptografarRSA(String valorBase64, String privateKey) {
    CriptografiaService criptografiaService = CriptografiaService();
    String resultado = criptografiaService.descriptografarRSA(valorBase64, privateKey);
    return resultado;
  }
}
