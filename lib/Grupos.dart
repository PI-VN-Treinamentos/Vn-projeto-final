import 'package:pi/Aluno.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Grupo {
  String nomeGrupo;
  List<Aluno> integrantes;

  Grupo(this.nomeGrupo, this.integrantes);

  // Outros métodos, se necessário

  // Método para converter dados do Firestore para um objeto Grupo
  factory Grupo.fromMap(Map<String, dynamic> map) {
    return Grupo(
      map['nomeGrupo'] ?? '',
      (map['integrantes'] as List<dynamic> ?? [])
          .map((alunoMap) => Aluno.fromMap(alunoMap))
          .toList(),
    );
  }

  // Método para converter dados para um mapa
  Map<String, dynamic> toMap() {
    return {
      'nomeGrupo': nomeGrupo,
      'integrantes': integrantes.map((aluno) => aluno.toMap()).toList(),
      // Adicione mais campos do grupo conforme necessário
    };
  }

  // Método para adicionar o grupo ao Firestore
  Future<void> adicionarAoFirestore(DocumentReference votacaoRef) async {
    try {
      // Adiciona a referência da votação à coleção "grupos"
      await FirebaseFirestore.instance.collection('grupos').add({
        'nomeGrupo': nomeGrupo,
        'integrantes': integrantes.map((aluno) => aluno.toMap()).toList(),
        'votacaoRef': votacaoRef, // Adiciona a referência da votação
      });
    } catch (e) {
      print("Erro ao adicionar grupo ao Firestore: $e");
      // Trate o erro conforme necessário
    }
  }
}