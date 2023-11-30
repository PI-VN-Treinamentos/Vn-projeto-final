import 'package:pi/Aluno.dart';
import 'package:pi/Usuario.dart';
import 'package:flutter/material.dart';
import 'package:pi/pages/Principal.dart';
import 'package:pi/pages/Recuperar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  bool queroEntrar = true;

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
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 50,
                height: 250,
                child: Image.asset('assets/LogoBranco.png'),
              ),
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
                  validator: (String? value) {
                    if (value == null) {
                      return "O e-mail não pode ser vazio";
                    }
                    if (value.length < 5) {
                      return "O e-mail é muito curto";
                    }
                    if (!value.contains("@")) {
                      return "O e-mail não é válido";
                    }
                    return null;
                  },
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
                    ),
                  ),
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
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Senha inválida. Deve ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
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
                  style: TextStyle(fontSize: 20, color: Colors.white),
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
                        controller: confirmarSenhaController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Senha inválida. Deve ter pelo menos 6 caracteres';
                          }
                          return null;
                        },
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
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: nomeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu nome';
                          }
                          return null;
                        },
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
                  visible: queroEntrar,
                  child: GestureDetector(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Recuperar(),
                          ),
                        );
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
                onTap: () {
                  botaoPrincipalClicado();
                },
                child: Container(
                  width: 100,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
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
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                child: GestureDetector(
                  child: InkWell(
                    onTap: () {
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
                        style: TextStyle(
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
      ),
    );
  }

  void botaoPrincipalClicado() {
    if (_formKey.currentState!.validate()) {
      // Lógica para o botão principal clicado
      if (queroEntrar) {
        // Lógica de login
        // Crie uma instância de Usuario com os dados do formulário
        Usuario usuario = Usuario(emailController.text, senhaController.text);

        // Faça o que for necessário com a instância de Usuario
        print('Usuário: ${usuario.email}, Senha: ${usuario.senha}');

        // Envie os dados para o servidor Django
        enviarDadosParaServidor(usuario);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Principal(nomeUsuario: nomeController.text)),
        );
      } else {
        // Lógica de cadastro
        // Crie uma instância de Aluno com os dados do formulário
        Aluno aluno = Aluno(
            emailController.text, senhaController.text, nomeController.text);

        // Faça o que for necessário com a instância de Aluno
        print(
            'Aluno: ${aluno.email}, Senha: ${aluno.senha}, Nome: ${aluno.nome}');

        // Envie os dados para o servidor Django
        enviarDadosParaServidor(aluno);

        // Alterar para "entrar" após cadastrar
        setState(() {
          queroEntrar = true;
        });
      }
    }
  }

  void enviarDadosParaServidor(dynamic dados) async {
  final String url = 'postgres://avnadmin:AVNS_7aqUmCwZm2OXLYaIWzR@pg-8f2db6b-aula.a.aivencloud.com:14375/defaultdb?sslmode=require';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(dados.toMap()), // Converta para Map antes de codificar em JSON
    );

    if (response.statusCode == 200) {
      print('Dados enviados com sucesso');
    } else {
      print('Erro ao enviar dados. Código de status: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro de conexão: $e');
  }
}

}
