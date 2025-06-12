import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Timer de 3 segundos para redirecionar para login
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/inicial');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF131010),
          border: Border.all(
            color: const Color(0xFFD202B3),
            width: 4,
          ),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/Projeto_Remover_fundoV2.png',
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
