import 'package:flutter/material.dart';
import 'package:pi/Grupos.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exibir nome da sessão e instituição
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Nome da Sessão: ${widget.nomeSessao}",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Nome da Instituição: ${widget.nomeInstituicao}",
                style: TextStyle(color: Colors.white),
              ),
            ),

            // Exibir grupos
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Grupos:",
                style: TextStyle(color: Colors.white),
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
                          if (gruposSelecionados.contains(widget.grupos[index].nomeGrupo)) {
                            gruposSelecionados.remove(widget.grupos[index].nomeGrupo);
                          } else {
                            gruposSelecionados.add(widget.grupos[index].nomeGrupo);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: gruposSelecionados.contains(widget.grupos[index].nomeGrupo)
                            ? Colors.green // Cor quando o grupo está selecionado
                            : Colors.blue, // Cor padrão
                      ),
                      child: Text(
                        widget.grupos[index].nomeGrupo,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Botão para prosseguir
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Faça algo com os grupos selecionados
                  print("Grupos Selecionados: $gruposSelecionados");
                },
                child: Text("Prosseguir"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
