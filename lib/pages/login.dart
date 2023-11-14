// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:pi/pages/Link.dart';
import 'package:pi/pages/Principal.dart';
import 'package:pi/pages/Recuperar.dart';
//import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  bool queroEntrar = true;

  /*Future<void> cadastrarUsuario() async {
    final response = await http.post(
      Uri.parse('http://seu-backend.com/cadastrar-usuario/'),
      body: {
        'nome': nomeController.text,
        'email': emailController.text,
        'senha': senhaController.text,
      },
    );

    if (response.statusCode == 200) {
      // Usuário cadastrado com sucesso
      print('Usuário cadastrado com sucesso');
    } else {
      // Erro no cadastro
      print('Erro ao cadastrar usuário');
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: const Color.fromARGB(255, 36, 36, 36),
        child: ListView(
          children: <Widget>[
            SizedBox(
                width: 50,
                height: 250,
                child: Image.asset('assets/LogoBranco.png')),
            const SizedBox(
              height: 60,
            ),
            TextSelectionTheme(
              data: const TextSelectionThemeData(
                cursorColor: Colors.white,
                selectionColor: Colors.blue,
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 90, 90, 90),
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      fontFamily: 'Lexend',
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    )),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextSelectionTheme(
              data: const TextSelectionThemeData(
                cursorColor: Colors.white,
                selectionColor: Colors.blue,
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 90, 90, 90),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    fontFamily: 'Lexend',
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextSelectionTheme(
              data: const TextSelectionThemeData(
                cursorColor: Colors.white,
                selectionColor: Colors.blue,
              ),
              child: Visibility(
                visible: !queroEntrar,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Confirme Senha",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 90, 90, 90),
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'Lexend',
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Nome"),
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 90, 90, 90),
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'Lexend',
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: Visibility(
                visible:
                    queroEntrar, // Mostrar apenas quando queroEntrar for verdadeiro
                child: GestureDetector(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Recuperar(),
                        ),
                      );
                      // Coloque a lógica que deseja executar quando o botão é pressionado aqui.
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Esqueceu a senha?",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Lexend',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 60,
            ),

            InkWell(
              onTap: () async {
                if (queroEntrar) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Principal()),
                  );
                  // Lógica de login
                } else {
                  // Lógica de cadastro
                  //await cadastrarUsuario();
                  // Alterar para "entrar" após cadastrar
                  setState(() {
                    queroEntrar = true;
                  });
                }
              },
              child: Container(
                width: 100,
                height: 60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 173, 173, 173),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(59)),
                ),
                child: Text(
                  queroEntrar ? "Entrar" : "Cadastrar",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
            ),

            // O restante do seu código...
            Container(
              height: 40,
              alignment: Alignment.center,
              child: GestureDetector(
                child: InkWell(
                  onTap: () {
                    // Mostrar o texto apenas se queroEntrar for verdadeiro (login)

                    setState(() {
                      queroEntrar = !queroEntrar;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (queroEntrar)
                          ? "Ainda não tem conta? Cadastre-se!"
                          : "Já tem conta? Entre!",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontFamily: 'Lexend',
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
