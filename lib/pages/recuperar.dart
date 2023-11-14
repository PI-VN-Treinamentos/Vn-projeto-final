import 'package:flutter/material.dart';
import 'package:pi/pages/Link.dart';
import 'package:pi/pages/Login.dart';

class Recuperar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color:Colors.white,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top:60,
          left:40,
          right:40,
        ),
        color: const Color.fromARGB(255, 36, 36, 36),
        child: ListView(
          children: <Widget> [
            SizedBox(
              width: 200,
              height: 200,
              
              child: Image.asset("assets/recuperar.png"),
              
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Esqueceu sua senha?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily:"Lexend",
                fontSize: 32,
                fontWeight: FontWeight.w500, ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Por favor, informe o E-mail associado a sua conta que enviaremos um link para a restauração de sua senha.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Lexend",
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 80,),
                TextSelectionTheme(
                  data: const TextSelectionThemeData(
                  cursorColor: Colors.white,
                  selectionColor: Colors.blue,

                ), 
                child: 
              TextFormField(
                
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 90, 90, 90),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    fontFamily: "Lexend",
                    
                    
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
              height: 140,
                  
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Link(),
                        ));
                
              
              },
              child: Container(
                width: 10,
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
                child: const Text(
                  "Enviar",
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

    );
  }
}


