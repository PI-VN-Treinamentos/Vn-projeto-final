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
  // Armazenar o grupo atualmente selecionado
  String? grupoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Escolha",
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
        color: const Color.fromARGB(255, 36, 36, 36),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,
                bottom: 5),
                child: Text(
                  "Nome da Sessão: ${widget.nomeSessao}",
                  style: TextStyle(color: Colors.white, fontFamily: 'Lexend', fontSize: 20,),
                ),
              ),
              SizedBox(height: 70,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Nome da Instituição: ${widget.nomeInstituicao}",
                  style: TextStyle(color: Colors.white, fontFamily: 'Lexend', fontSize: 20),
                ),
              ),
              SizedBox(height: 70,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Grupos:",
                  style: TextStyle(color: Colors.white, fontFamily: 'Lexend', fontSize: 20),
                ),
              ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                child: DropdownButton<String>(
                  value: grupoSelecionado,
                  onChanged: (String? novoGrupoSelecionado) {
                    setState(() {
                      grupoSelecionado = novoGrupoSelecionado;
                    });
                  },
                  items: widget.grupos.map<DropdownMenuItem<String>>((Grupo grupo) {
                    return DropdownMenuItem<String>(
                      value: grupo.nomeGrupo,
                      child: SizedBox(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              grupo.nomeGrupo,
                              style: TextStyle(color: Colors.white, fontFamily: 'Lexend', fontSize: 20),
                            ),
                            if (grupoSelecionado == null) // Verifica se o hint text está sendo exibido
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  style: TextStyle(color: Colors.white, fontFamily: 'Lexend', fontSize: 20),
                  hint: Text("Selecione um grupo"),
                  isExpanded: false,
                  dropdownColor: Colors.blue,
                ),
              ),
            ),



              Container(
                width: 600,
                height: 60,
                margin: const EdgeInsets.only(top: 400,),
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
                    print("Grupo Selecionado: $grupoSelecionado");
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
