import 'package:flutter/material.dart';
import 'package:pi/QrcodeScan.dart';
import 'package:pi/pages/CriarVotacao.dart';
import 'package:pi/pages/InstituicoesAdm.dart';
import 'package:pi/pages/Link.dart';
import 'package:pi/pages/Login.dart';
import 'package:flutter/gestures.dart';
import 'package:pi/servicos/autenticacao_servico.dart';

class TelaProfessor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Olá, Luciano Venelli",
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 30,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        color: const Color.fromARGB(255, 36, 36, 36),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Criar Votação",
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),

                  // Adicione outros widgets de texto conforme necessário
                ],
              ),
            ),

            // Adicionando o Card clicável ao lado do texto
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CriarVotacao()),
                );
              },
              child: Card(
                margin: const EdgeInsets.all(16.0),
                color: Color.fromARGB(22, 255, 255, 255),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ), // Cor de fundo do card

                child: Column(
                  children: [
                    Container(
                      height: 4.0,
                      width: double.infinity,
                      color: Colors.orange, // Cor da borda superior
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 60,
                        bottom: 50,
                        left: 50,
                        right: 50,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Criar a sessão votação com grupos e perguntas.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lexend',
                                fontSize: 18.0,
                              ),
                            ),
                          ),

                          // Adicione outros widgets aqui conforme necessário
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Texto "Histórico" acima do novo Card
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Histórico',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            // Segundo Card
            GestureDetector(
              onTap: () {
                // Adicione a ação desejada para o segundo Card
                print("Segundo Card clicado!");
              },
              child: Card(
                margin: const EdgeInsets.all(16.0),
                color: Color.fromARGB(22, 255, 255, 255),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ), // Cor de fundo do segundo card

                child: Column(
                  children: [
                    Container(
                      height: 4.0,
                      width: double.infinity,
                      color: Color.fromARGB(255, 32, 115, 223),
                      // Cor da borda superior do segundo card
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 60,
                        bottom: 60,
                        left: 50,
                        right: 50,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Consultar, editar ou deletar sessões já criadas.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 18.0,
                                  color: Colors.white),
                            ),
                          ),

                          // Adicione outros widgets aqui conforme necessário
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Texto "Configurações" acima do terceiro Card
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Instituições',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            // Terceiro Card (sem alterações)
           GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InstituicaoAdm(nomeUsuario: "",)),
                );
              },
              child: Card(
                margin: const EdgeInsets.all(16.0),
                color: Color.fromARGB(22, 255, 255, 255),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ), // Cor de fundo do terceiro card

                child: Column(
                  children: [
                    Container(
                      height: 4.0,
                      width: double.infinity,
                      color: Color.fromARGB(255, 174, 248, 1),
                      // Cor superior do terceiro card
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 60,
                        bottom: 60,
                        left: 50,
                        right: 50,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Consultar, editar, deletar e criar sessões para instituições cadastradas.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 18.0,
                                  color: Colors.white),
                            ),
                          ),

                          // Adicione outros widgets aqui conforme necessário
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // Adicionando ícones no rodapé da página
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ícone de usuário no canto inferior esquerdo
            Padding(
              padding: const EdgeInsets.only(
                  right: 40.0, left: 60.0, bottom: 10.0, top: 10.0),
              child: IconButton(
                icon: Icon(Icons.person_rounded, color: Colors.white),
                onPressed: () {
                  // Adicione a ação desejada para o ícone de usuário
                },
              ),
            ),
            // Ícone de sair no canto inferior direito
            Padding(
              padding: const EdgeInsets.only(
                  right: 60.0, left: 40.0, bottom: 10.0, top: 10.0),
              child: IconButton(
                icon: Icon(Icons.exit_to_app_rounded, color: Colors.white),
                onPressed: () {
                  AutenticacaoServico().deslogar();
                  // Adicione a ação desejada para o ícone de sair
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
