import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pi/Aluno.dart';
import 'package:pi/Grupos.dart';
import 'package:pi/Usuario.dart';


class DBFirestore {
  DBFirestore._();
  static final DBFirestore _instance = DBFirestore._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return DBFirestore._instance._firestore;
  }
  static Future<void> adicionarAluno(Aluno aluno) async {
    try {
      await _instance._firestore.collection('alunos').add(aluno.toMap());
    } catch (e) {
      print('Erro ao adicionar usuário ao Firestore: $e');
    }
  }


  
}
