import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png'),
          OutlinedButton(
            onPressed: () {
              //vezes que o botão foi pressionado;
            }, 
            child: const Text("Botão"),),
          const Text("")
        ],
      ),
    ),
    );
}
}