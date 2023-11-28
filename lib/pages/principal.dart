import 'package:flutter/material.dart';
import 'package:pi/QrcodeScan.dart';
import 'package:pi/pages/Login.dart';
import 'package:flutter/gestures.dart';

class Principal extends StatelessWidget {
  final String nomeUsuario; 
  const Principal({Key? key, required this.nomeUsuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Olá, $nomeUsuario",
          style: const TextStyle(
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
                    "Entrar na Sessão",
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
            Card(
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                      bottom: 20,
                      left: 50,
                      right: 50,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRCodeScan()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 31, 30, 30),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                              child: const Text('QR Code'),
                            ),
                          ],
                        ),
                        const Expanded(
                          child: Text(
                            'Entrar na sessão de votação com grupos e perguntas.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lexend',
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 31, 30, 30),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                              child: const Text('Código'),
                            ),
                          ],
                        )
                        // Adicione outros widgets aqui conforme necessário
                      ],
                    ),
                  ),
                ],
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
                      color: Color.fromARGB(255, 32, 115,
                          223), // Cor da borda superior do segundo card
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
                              'Consultar sessões já acessadas, abertas ou encerradas.',
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
                'Configurações',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            // Terceiro Card (sem alterações)
            GestureDetector(
              onTap: () {
                // Adicione a ação desejada para o segundo Card
                print("Terceiro Card clicado!");
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
                      color: Colors.white, // Cor superior do terceiro card
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
                              'Mudar tema, adicionar foto de perfil, consultar versão, etc.',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
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
