import 'package:pi/Aluno.dart';

class Grupos {
  String nomeGrupo;
  List<Aluno> integrantes;

  Grupos(this.nomeGrupo, this.integrantes);

  // Outros métodos, se necessário

  // Exemplo de método para adicionar um integrante ao grupo
  void adicionarIntegrante(Aluno aluno) {
    integrantes.add(aluno);
  }

  // Exemplo de método para remover um integrante do grupo
  void removerIntegrante(Aluno aluno) {
    integrantes.remove(aluno);
  }

  // Método para converter dados para um mapa
  Map<String, dynamic> toMap() {
    return {
      'nomeGrupo': nomeGrupo,
      'integrantes': integrantes.map((aluno) => aluno.toMap()).toList(),
      // Adicione mais campos do grupo conforme necessário
    };
  }
}
