import 'package:pi/Usuario.dart';
class Aluno extends Usuario {
  String _nome;

  Aluno(String email, String senha, this._nome) : super(email, senha);

  // Método getter e setter para o nome
  String get nome => _nome;
  set nome(String value) => _nome = value;

  // Método para converter dados para um mapa
  @override
  Map<String, dynamic> toMap() {
    // Chama o método toMap da classe pai (Usuario)
    Map<String, dynamic> mapaUsuario = super.toMap();
    
    // Adiciona as informações específicas de Aluno
    mapaUsuario['nome'] = _nome;

    return mapaUsuario;
  }
}
