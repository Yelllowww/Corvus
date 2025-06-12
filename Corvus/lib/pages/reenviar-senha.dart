import 'package:flutter/material.dart';

class HomePageCopyWidget extends StatefulWidget {
  const HomePageCopyWidget({super.key});

  @override
  State<HomePageCopyWidget> createState() => _HomePageCopyWidgetState();
}

class _HomePageCopyWidgetState extends State<HomePageCopyWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                // Título "Corvus"
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  child: Text(
                    'Corvus',
                    style: TextStyle(
                      fontSize: 47,
                      color: Color(0xFFCE76E8),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                // Subtítulo "Definir Nova Senha"
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  child: Text(
                    'Definir Nova Senha',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Campos e botão
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.35,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Campo 1
                        _buildLabel('Digite Sua Nova Senha'),
                        SizedBox(height: 5),
                        _buildTextField(_newPasswordController, obscure: true),

                        SizedBox(height: 20),

                        // Campo 2
                        _buildLabel('Repita a Nova Senha'),
                        SizedBox(height: 5),
                        _buildTextField(_repeatPasswordController, obscure: true),

                        SizedBox(height: 30),

                        // Botão
                        SizedBox(
                          width: 95,
                          height: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFCE76E8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('Button pressed...');
                              }
                            },
                            child: Text(
                              'Pronto',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
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

  Widget _buildLabel(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          ' *',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, {bool obscure = false}) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'TextField',
          isDense: true,
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo obrigatório';
          }
          return null;
        },
      ),
    );
  }
}
