import 'package:flutter/material.dart';
import 'package:pi/Grupos.dart';
import 'package:pi/pages/Votacao.dart';

class Escolha extends StatefulWidget {
  final String nomeSessao;
  final String nomeInstituicao;
  final List<Grupo> grupos;

  Escolha({
    required this.nomeSessao,
    required this.nomeInstituicao,
    required this.grupos,
  });

  @override
  _EscolhaState createState() => _EscolhaState();
}

class _EscolhaState extends State<Escolha> {
  // Lista para armazenar os grupos selecionados
  List<String> gruposSelecionados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha"),
      ),
      
      body: Container(
        color: const Color.fromARGB(255, 36, 36, 36),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os filhos horizontalmente
            children: [
              // Exibir nome da sessão e instituição
              Padding(
                padding: const EdgeInsets.only(top: 70,
                ),
                child: Text(
                  "Nome da Sessão: ${widget.nomeSessao}",
                  style: TextStyle(color: Colors.white, fontFamily: 'Lexend', fontSize: 20,),
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Nome da Instituição: ${widget.nomeInstituicao}",
                  style: TextStyle(color: Colors.white, fontFamily: 'Lexend', fontSize: 20),
                ),
              ),
              SizedBox(height: 50,),

              // Exibir grupos
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Grupos:",
                  style: TextStyle(color: Colors.white, fontFamily: 'Lexend', fontSize: 20),
                ),
              ),

              // Lista de botões para os grupos
              Expanded(
                child: ListView.builder(
                  itemCount: widget.grupos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Adicione ou remova o grupo da lista de selecionados
                          setState(() {
                            if (gruposSelecionados
                                .contains(widget.grupos[index].nomeGrupo)) {
                              gruposSelecionados
                                  .remove(widget.grupos[index].nomeGrupo);
                            } else {
                              gruposSelecionados
                                  .add(widget.grupos[index].nomeGrupo);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: gruposSelecionados
                                  .contains(widget.grupos[index].nomeGrupo)
                              ? Colors.green // Cor quando o grupo está selecionado
                              : Colors.blue, // Cor padrão
                        ),
                        child: Text(
                          widget.grupos[index].nomeGrupo,
                          style: TextStyle(color: Colors.white, fontFamily: 'Lexend', fontSize: 20,),
                        ),
                      ),
                    );
                  },
                ),
              ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Votacao(),
                      ),
                    );

                    print("Grupos Selecionados: $gruposSelecionados");
                  },
                    child: const Text(
                      "Avançar",
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
    );
  }
}
