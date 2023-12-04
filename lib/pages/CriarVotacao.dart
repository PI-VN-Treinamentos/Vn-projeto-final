
import 'package:flutter/material.dart';
import 'package:pi/Aluno.dart';
import 'package:pi/Grupos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pi/DBFirestore.dart';
import 'package:pi/pages/Codigo.dart';
import 'package:random_string/random_string.dart';
import 'package:pi/pages/AlunoCodigo.dart';
import 'package:pi/pages/GeradorCodigoVotacao.dart';
import 'package:pi/pages/VotacaoInfo.dart';

class CriarVotacao extends StatefulWidget {
  @override
  _CriarVotacaoState createState() => _CriarVotacaoState();
}

class _CriarVotacaoState extends State<CriarVotacao> {
  int numeroGrupos = 0;
  List<Grupo> grupos = [];
  
  TextEditingController _nomeSessaoController = TextEditingController();
  TextEditingController _nomeInstituicaoController = TextEditingController();
  TextEditingController _perguntaController = TextEditingController();

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
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          "Nome da Sessão",
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 1,
                    left: 5,
                    right: 5,
                    bottom: 1,
                  ),
                  child: Container(
                    width: 570,
                    child: TextField(
                      controller: _nomeSessaoController,
                      decoration: const InputDecoration(
                        hintText: 'Digite o nome da sessão.',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lexend',
                        fontSize: 15,
                      ),
                      cursorColor: Colors.white,
                      showCursor: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          "Nome da Instituição",
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    width: 570,
                    child: TextField(
                      controller: _nomeInstituicaoController,
                      decoration: const InputDecoration(
                        hintText: 'Digite o nome da instituição.',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lexend',
                        fontSize: 15,
                      ),
                      cursorColor: Colors.white,
                      showCursor: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          "Pergunta",
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    width: 570,
                    child: TextField(
                      controller: _perguntaController,
                      decoration: const InputDecoration(
                        hintText: 'Digite a pergunta a ser feita.',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lexend',
                        fontSize: 15,
                      ),
                      cursorColor: Colors.white,
                      showCursor: true,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 900,
                  height: 1,
                  color: const Color.fromARGB(255, 241, 241, 241),
                ),
                // Botão + Grupos
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Grupos",
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                numeroGrupos++;
                                // Adiciona um novo grupo à lista de grupos
                                grupos.add(
                                  Grupo(
                                    "Grupo $numeroGrupos",
                                    List<
                                        Aluno>.empty(), // Começa com uma lista vazia de alunos
                                  ),
                                );
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                if (numeroGrupos > 0) {
                                  numeroGrupos--;
                                  // Remove o último grupo da lista
                                  grupos.removeLast();
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 600,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: numeroGrupos,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Grupo ${index + 1}',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15.0),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lexend',
                              fontSize: 15,
                            ),
                            cursorColor: Colors.white,
                            showCursor: true,
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Restante do código...
                Container(
                  width: 600,
                  height: 60,
                  margin: const EdgeInsets.only(top: 16),
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
                  child: TextButton(
                    onPressed: () {
                      _criarVotacao();
                    },
                    child: const Text(
                      "Criar",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 25,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _criarVotacao() async {
    String nomeSessao = _nomeSessaoController.text;
    String nomeInstituicao = _nomeInstituicaoController.text;
    String pergunta = _perguntaController.text;

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

     try {
      String codigoVotacao = await GeradorCodigoVotacao.gerarEArmazenarCodigo();
      VotacaoInfo.codigoVotacao = codigoVotacao;

      // Criação da votação sem a inclusão direta de grupos
      DocumentReference novaVotacao =
          await _firestore.collection('votacoes').add({
        'nomeSessao': nomeSessao,
        'nomeInstituicao': nomeInstituicao,
        'pergunta': pergunta,
        'codigoVotacao': codigoVotacao,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Adiciona a referência da votação criada à coleção de grupos
        // Adiciona a referência da votação criada à coleção de grupos
        for (int i = 0; i < grupos.length; i++) {
          await novaVotacao.collection('grupos').add({
            'nomeGrupo': grupos[i].nomeGrupo, // Use o nome real do grupo aqui
            'integrantes': grupos[i].integrantes.map((aluno) => aluno.toMap()).toList(),
            // Adicione outros campos conforme necessário
          });
          }



      print("Votação criada com sucesso!");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Codigo(
            nomeSessao: nomeSessao,
            nomeInstituicao: nomeInstituicao,
            codigoVotacao: codigoVotacao,
          ),
        ),
      );
    } catch (e) {
      print("Erro ao criar votação: $e");
    }
  }
}

    