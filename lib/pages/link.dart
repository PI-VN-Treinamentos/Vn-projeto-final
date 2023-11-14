import 'package:flutter/material.dart';

class Link extends StatelessWidget {
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
          top:200,
          left:40,
          right:70,
        ),
         color: const Color.fromARGB(255, 36, 36, 36),
        child: ListView(
          children: <Widget> [
            SizedBox(
                            
              width: 200,
              height: 200,
                          
              child: Image.asset("assets/check.png"),
              
              
            ),
            const SizedBox(
              height: 30,
            ),
           ],
        ),
        
      )
    );
  }
}
 //
