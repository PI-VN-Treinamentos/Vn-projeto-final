import 'package:flutter/material.dart';


class Codigo extends StatelessWidget {
  final String nomeSessao;
  final String nomeInstituicao;
  final String codigoVotacao;

  Codigo({
    required this.nomeSessao,
    required this.nomeInstituicao,
    required this.codigoVotacao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Criar",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 30,
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
        color: const Color.fromARGB(255, 36, 36, 36),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 150,
                    left: 90,
                    right: 90,
                    bottom: 20,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Nome da Sessão:",
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          nomeSessao,
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 90,
                    right: 90,
                    bottom: 20,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Instituição:",
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          nomeInstituicao,
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 900,
                  height: 1,
                  color: const Color.fromARGB(255, 241, 241, 241),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 90,
                    right: 90,
                    bottom: 20,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Código de entrada",
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 900,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        codigoVotacao,
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}