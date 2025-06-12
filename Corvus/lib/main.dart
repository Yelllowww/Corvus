import 'package:flutter/material.dart';
import 'pages/inicial_page.dart';
import 'pages/cadastroperfil_page.dart';
import 'pages/splash_page.dart'; // aqui está sua InicialPage
import 'pages/login_page.dart';
import 'pages/esqueci_senha.dart';
import 'pages/reenviar-senha.dart';
import 'pages/cadastro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Cadastro',
      theme: ThemeData.dark(),
      initialRoute: '/', // Começa pela splash
      routes: {
        '/': (context) => const SplashPage(), // Splash Screen
        '/inicial': (context) => const LoginPage(),
        '/login': (context) => const HomePageWidget(),
        '/cadastroperfil': (context) => const CadastroPage(),
        '/esqueci-senha': (context) => const ForgotPasswordPage(),
        '/reenviar-senha': (context) => const HomePageCopyWidget(),
        '/cadastro': (context) => const CadastroScreen(),

      },
    );
  }
}
