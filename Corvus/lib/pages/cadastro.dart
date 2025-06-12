import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final usuarioController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final repetirSenhaController = TextEditingController();

  bool _obscureSenha = true;
  bool _obscureRepetir = true;

  @override
  void dispose() {
    nomeController.dispose();
    usuarioController.dispose();
    emailController.dispose();
    senhaController.dispose();
    repetirSenhaController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      hintText: 'Digite aqui...',
      label: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          children: const [
            TextSpan(
              text: ' *',
              style: TextStyle(color: Color(0xFFEC2302)),
            ),
          ],
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        'Corvus',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB61BE6),
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        'Cadastro de usuário',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: nomeController,
                      decoration: _inputDecoration('Nome'),
                      style: TextStyle(color: Colors.black),
                      validator: (value) =>
                      value!.isEmpty ? 'Preencha seu nome' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: usuarioController,
                      decoration: _inputDecoration('Nome de usuário'),
                      style: TextStyle(color: Colors.black),
                      validator: (value) =>
                      value!.isEmpty ? 'Preencha seu nome de usuário' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: emailController,
                      decoration: _inputDecoration('Email'),
                      style: TextStyle(color: Colors.black),
                      validator: (value) =>
                      value!.isEmpty || !value.contains('@')
                          ? 'Email inválido'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: senhaController,
                      obscureText: _obscureSenha,
                      style: TextStyle(color: Colors.black),
                      decoration: _inputDecoration('Senha').copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureSenha
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => _obscureSenha = !_obscureSenha);
                          },
                        ),
                      ),
                      validator: (value) =>
                      value!.length < 6 ? 'Senha muito curta' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: repetirSenhaController,
                      obscureText: _obscureRepetir,
                      style: TextStyle(color: Colors.black),
                      decoration: _inputDecoration('Repetir senha').copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureRepetir
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => _obscureRepetir = !_obscureRepetir);
                          },
                        ),
                      ),
                      validator: (value) => value != senhaController.text
                          ? 'As senhas não coincidem'
                          : null,
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Cadastro realizado com sucesso!'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFB61BE6),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'PRÓXIMO',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Já tem uma conta? ',
                          style: TextStyle(color: Colors.white70),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero, // para o botão não ter padding extra
                            minimumSize: Size(0, 0), // para evitar tamanho mínimo
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft,
                          ),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              color: Color(0xFF8282FF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Image.asset(
                'assets/images/Projeto_Remover_fundoV2.png',
                width: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
