import 'package:flutter/material.dart';
import 'package:pi/pages/Login.dart';
import 'package:flutter/gestures.dart';

class InstituicaoAdm extends StatelessWidget {
  final String nomeUsuario;
  const InstituicaoAdm({Key? key, required this.nomeUsuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Instituições", // Changed from "Histórico"
          style:  TextStyle(
            fontFamily: 'Lexend',
            fontSize: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Add action for the + button
                print("Add action for + button");
              },
              child: const Text('+'),
            ),
          ),
        ],
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding:  EdgeInsets.only(
          top: 50,
        ),
        color:  Color.fromARGB(255, 36, 36, 36),
        child: Column(
          children: [
             Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Instituições", // Changed from "Histórico"
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  // "Institutos" text and + button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Institutos",
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            // ação do bottão de + 
                            print("Add action for + button");
                          },
                          child:  Text('+'),
                        ),
                      ],
                    ),
                  ),
                  // Bar
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          contentPadding:  EdgeInsets.all(10.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Card 1
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Mauá', // Changed from 'Sessão 1'
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            // Card 1 content
            Card(
              margin: const EdgeInsets.all(16.0),
              color: Color.fromARGB(22, 255, 255, 255),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 4.0,
                    width: double.infinity,
                    color: Colors.orange,
                  ),
                  // Text Field 1
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Text Field 1',
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Card 2
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Instituto 1', // Changed from 'Sessão 2'
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            // Card 2 content
            GestureDetector(
              onTap: () {
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
                ),
                child: Column(
                  children: [
                    Container(
                      height: 4.0,
                      width: double.infinity,
                      color: Color.fromARGB(255, 32, 115, 223),
                    ),
                    // Text Field 2
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Text Field 2',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Card 3
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Instituto 2', // Changed from 'Sessão 3'
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            // Card 3 content
            GestureDetector(
              onTap: () {
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
                ),
                child: Column(
                  children: [
                    Container(
                      height: 4.0,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    // Text Field 3
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Text Field 3',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Card 4
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Instituto 3', // Changed from 'Sessão 4'
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            // Card 4 content
            GestureDetector(
              onTap: () {
                print("Quarto Card clicado!");
              },
              child: Card(
                margin: const EdgeInsets.all(16.0),
                color: Color.fromARGB(22, 255, 255, 255),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 4.0,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    // Text Field 4
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Text Field 4',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Centered text for no institutions
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Não há mais instituições cadastradas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),

            // Rest of your code remains unchanged
            // ...

          ],
        ),
      ),
      // Add other modifications as needed
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
