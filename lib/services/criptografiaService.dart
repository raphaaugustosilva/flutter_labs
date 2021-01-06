import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class CriptografiaService {
  String criptografarRSA(String valorRaw, String publicKey) {
    //Criptografa usando a chave pública
    final rsaPublicKey = RSAKeyParser().parse(publicKey);
    Encrypter encrypter = Encrypter(RSA(publicKey: rsaPublicKey));
    Encrypted encrypted = encrypter.encryptBytes(utf8.encode(valorRaw));

    String resultado = encrypted.base64;
    return resultado;
  }

  String descriptografarRSA(String valorBase64, String privateKey) {
    //Descriptografa usando a chave privada
    final rsaPrivateKey = RSAKeyParser().parse(privateKey);
    Encrypter encrypter = Encrypter(RSA(privateKey: rsaPrivateKey));
    Encrypted valorEncrypted = Encrypted.from64(valorBase64);

    List<int> valorBytes = encrypter.decryptBytes(valorEncrypted);
    String valorRaw = utf8.decode(valorBytes);

    String resultado = valorRaw;
    return resultado;
  }
}
