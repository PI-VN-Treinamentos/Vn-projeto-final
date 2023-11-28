import 'package:pi/usuario.dart';

class Aluno extends Usuario {
  String _nome;

  Aluno(String email, String senha, this._nome) : super(email, senha);

  // Método getter e setter para o nome
  String get nome => _nome;
  set nome(String value) => _nome = value;
}