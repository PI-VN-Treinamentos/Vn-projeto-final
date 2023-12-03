import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

class GeradorCodigoVotacao {
  static Future<String> gerarEArmazenarCodigo() async {
    String codigoVotacao = randomAlphaNumeric(6);

    // Adicione o código ao banco de dados
    await FirebaseFirestore.instance.collection('codigos_votacao').add({
      'codigoVotacao': codigoVotacao,
      'timestamp': FieldValue.serverTimestamp(),
    });

    return codigoVotacao;
  }
}
