import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pi/pages/Escolha.dart';
import 'package:pi/pages/Link.dart';
import 'package:pi/Aluno.dart';
import 'package:pi/Grupos.dart'; 

class AlunoCodigo extends StatelessWidget {
  final TextEditingController _codigoController = TextEditingController();
  String _mensagemErro = "";

  Future<String> _recuperarCodigoVotacaoDoBancoDeDados() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('codigos_votacao')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first['codigoVotacao'];
      }

      throw Exception("Código de votação não encontrado no banco de dados");
    } catch (e) {
      throw Exception("Erro ao recuperar código do banco de dados: $e");
    }
  }

 Future<List<Grupo>> _recuperarGruposDoFirestore(String codigoVotacao) async {
  try {
    // Faça uma consulta para obter o documento correspondente ao código de votação
    DocumentSnapshot votacaoSnapshot = await FirebaseFirestore.instance
        .collection('votacoes')
        .where('codigoVotacao', isEqualTo: codigoVotacao)
        .get()
        .then((value) => value.docs.first);

    // Verifique se o documento da votação existe
    if (votacaoSnapshot.exists) {
      // Recupere a referência para a subcoleção 'grupos' dentro do documento da votação
      CollectionReference gruposCollectionRef =
          votacaoSnapshot.reference.collection('grupos');

      // Faça uma consulta para obter todos os documentos da subcoleção 'grupos'
      QuerySnapshot gruposSnapshot = await gruposCollectionRef.get();

      // Inicialize uma lista para armazenar os grupos
      List<Grupo> grupos = [];

      // Itere sobre os documentos e converta cada um para um objeto Grupo
      for (QueryDocumentSnapshot grupoDoc in gruposSnapshot.docs) {
        Grupo grupo = Grupo.fromMap(grupoDoc.data() as Map<String, dynamic>);
        grupos.add(grupo);
      }

      return grupos;
    } else {
      throw Exception("Documento de votação não encontrado para o código $codigoVotacao");
    }
  } catch (e) {
    print("Erro ao recuperar grupos do Firestore: $e");
    throw Exception("Erro ao recuperar grupos do Firestore");
  }
}





 void _verificarCodigo(BuildContext context) async {
  _mensagemErro = "";

  try {
    String codigoVotacaoBanco = await _recuperarCodigoVotacaoDoBancoDeDados();
    String codigoInserido = _codigoController.text;

    if (codigoInserido.trim() == codigoVotacaoBanco.trim()) {
      // Recupere as outras informações necessárias da votação do Firestore
      DocumentSnapshot votacaoSnapshot = await FirebaseFirestore.instance
          .collection('votacoes')
          .where('codigoVotacao', isEqualTo: codigoVotacaoBanco)
          .get()
          .then((value) => value.docs.first);

      String nomeSessao = votacaoSnapshot['nomeSessao'];
      String nomeInstituicao = votacaoSnapshot['nomeInstituicao'];

      // Recupere a lista de grupos do Firestore
      List<Grupo> grupos = await _recuperarGruposDoFirestore(codigoVotacaoBanco);
      print("Grupos recuperados: $grupos");

      // Navegue para a tela Escolha passando as informações necessárias
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Escolha(
            nomeSessao: nomeSessao,
            nomeInstituicao: nomeInstituicao,
            grupos: grupos,
          ),
        ),
      );
    } else {
      _mensagemErro = "Código inválido";
      print("Código inválido");
    }
  } catch (e) {
    print("Erro ao recuperar código do banco de dados: $e");
    _mensagemErro = "Erro ao verificar o código";
  }
}









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Entrar",
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
                  padding: EdgeInsets.only(
                      top: 250, left: 60, right: 60, bottom: 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Código de Entrada",
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
                    left: 20,
                    right: 20,
                    bottom: 1,
                  ),
                  child: Container(
                    width: 570,
                    child: TextField(
                      controller: _codigoController,
                      decoration: const InputDecoration(
                        hintText: 'Digite o código de entrada.',
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
                SizedBox(height: 30,),
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
                    onPressed: () => _verificarCodigo(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Entrar",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 25,
                            fontFamily: 'Lexend',
                          ),
                        ),
                        if (_mensagemErro.isNotEmpty)
                          Text(
                            _mensagemErro,
                            style: const TextStyle(color: Colors.red),
                          ),
                      ],
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
}
