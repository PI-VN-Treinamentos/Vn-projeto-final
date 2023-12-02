class Questao {
  int idPergunta;
  String enunciado;

  Questao({required this.idPergunta, required this.enunciado});

  // Método para converter um mapa em uma instância de Questao
  factory Questao.fromMap(Map<String, dynamic> map) {
    return Questao(
      idPergunta: map['idPergunta'],
      enunciado: map['enunciado'],
    );
  }

  // Método para converter uma instância de Questao em um mapa
  Map<String, dynamic> toMap() {
    return {
      'idPergunta': idPergunta,
      'enunciado': enunciado,
    };
  }
}
