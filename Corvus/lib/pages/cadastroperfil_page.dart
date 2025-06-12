import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  static const String routeName = '/cadastro';

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController descricaoController = TextEditingController();
  String? jogoPreferido;
  String? estiloJogo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                'Corvus',
                style: TextStyle(
                  fontFamily: 'Graduate',
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFCE76E8),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Crie seu perfil',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),

              // Avatar
              Container(
                width: 130,
                height: 160,
                decoration: BoxDecoration(
                  color: Color(0xFFEE07EE),
                  border: Border.all(color: Color(0xFFDA12BC), width: 5),
                ),
                child: Image.network(
                  'https://images.unsplash.com/photo-1640960543409-dbe56ccc30e2',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text('Foto*', style: TextStyle(color: Colors.white)),

              const SizedBox(height: 24),

              // Descrição
              Text('Descrição*', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 4),
              TextFormField(
                controller: descricaoController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: 'Digite aqui',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),

              const SizedBox(height: 24),

              // Jogos preferidos
              Text('Jogos preferidos*', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 4),
              DropdownButtonFormField<String>(
                value: jogoPreferido,
                onChanged: (val) => setState(() => jogoPreferido = val),
                items: ['League of Legends', 'Valorant', 'Fortnite']
                    .map((game) => DropdownMenuItem(value: game, child: Text(game)))
                    .toList(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                dropdownColor: Colors.grey[900],
                style: TextStyle(color: Colors.white),
                hint: Text('Selecione...', style: TextStyle(color: Colors.grey[500])),
              ),

              const SizedBox(height: 24),

              // Estilo de jogo
              Text('Estilo de Jogo', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 4),
              DropdownButtonFormField<String>(
                value: estiloJogo,
                onChanged: (val) => setState(() => estiloJogo = val),
                items: ['RPG', 'FPS', 'MOBA']
                    .map((estilo) => DropdownMenuItem(value: estilo, child: Text(estilo)))
                    .toList(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                dropdownColor: Colors.grey[900],
                style: TextStyle(color: Colors.white),
                hint: Text('Selecione...', style: TextStyle(color: Colors.grey[500])),
              ),

              const SizedBox(height: 48),

              // Logo no rodapé
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/Projeto_Remover_fundoV2.png',
                  width: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
