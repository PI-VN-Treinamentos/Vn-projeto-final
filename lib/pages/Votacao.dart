import 'package:flutter/material.dart';

class Votacao extends StatefulWidget {
  @override
  _VotacaoScreenState createState() => _VotacaoScreenState();
}

class _VotacaoScreenState extends State<Votacao> {
  List<int> trabalhos = List.generate(5, (index) => index + 1);
  int trabalhoAtual = 1;
  int indiceTrabalhoAtual = 0;
  int trabalhoSendoComparado = 2;
  int indiceTrabalhoSendoComparado = 1;
  int quantidadeVotos = 0;
  bool votacaoConcluida = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Votações Grupos",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 25,
              ),
            )
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20), // Adiciona espaçamento no topo
        color: Color.fromARGB(255, 36, 36, 36), // Cor de fundo da tela
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!votacaoConcluida)
                Column(
                  children: [
                    Text(
                      'Qual grupo teve o trabalho mais criativo?',
                      style: TextStyle(fontSize: 20, fontFamily: 'Lexend', color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Cor de fundo do botão
                            foregroundColor: Colors.white, // Cor do texto
                            textStyle: TextStyle(fontFamily: 'Lexend'), // Família da fonte
                          ),
                          onPressed: () {
                            _votar(indiceTrabalhoAtual, indiceTrabalhoSendoComparado);
                          },
                          child: Text('Grupo $trabalhoAtual'),
                        ),
                        SizedBox(width: 10),
                        if (indiceTrabalhoAtual < trabalhos.length - 1)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Cor de fundo do botão
                              foregroundColor: Colors.white, // Cor do texto
                              textStyle: TextStyle(fontFamily: 'Lexend'), // Família da fonte
                            ),
                            onPressed: () {
                              _votar(indiceTrabalhoSendoComparado, indiceTrabalhoAtual);
                            },
                            child: Text('Grupo $trabalhoSendoComparado'),
                          ),
                      ],
                    ),
                  ],
                ),
              if (votacaoConcluida)
                Column(
                  children: [
                    Text('Ranking:', style: TextStyle(fontSize: 20, fontFamily: 'Lexend', color: Colors.white),
                    ),
                    for (int i = 0; i < trabalhos.length; i++)
                      Text('Posição ${i + 1}: Grupo ${trabalhos[i]}', style: TextStyle(fontSize: 15, fontFamily: 'Lexend', color: Colors.white),),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _votar(int indiceTrabalhoVotado, int indiceTrabalhoNaoVotado) {
    setState(() {
      if (trabalhos[indiceTrabalhoVotado] != trabalhoAtual) {
        trabalhos.insert(indiceTrabalhoAtual, trabalhos[indiceTrabalhoVotado]);
        trabalhos.removeAt(indiceTrabalhoVotado + 1);
      }

      trabalhoAtual = trabalhos[indiceTrabalhoAtual + 1];
      indiceTrabalhoAtual++;

      if (indiceTrabalhoAtual < trabalhos.length - 1) {
        trabalhoSendoComparado = trabalhos[indiceTrabalhoAtual + 1];
        indiceTrabalhoSendoComparado++;
      } else {
        trabalhoSendoComparado = trabalhos[0];
        indiceTrabalhoSendoComparado = 0;

        if (indiceTrabalhoAtual >= trabalhos.length - 1) {
          votacaoConcluida = true;
        }
      }
    });
  }
}
