import 'package:marombapp/_common/minhas_cores.dart';
import 'package:flutter/material.dart';
import 'package:marombapp/components/decoracao_campo_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool queroAcessar = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.fundoDark,
      // Color(0xFF494848)
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MinhasCores.blackTopoGradiente,
                  MinhasCores.blackBaixoGradiente
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "images/AppMaromba.png",
                        height: queroAcessar ? 128 : 55,
                      ),
                      const Text(
                        'MarombaApp',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (String? value) {
                          if (value == null) {
                            return 'o E-mail não pode ser vazio!';
                          }
                          if (!value.contains('@')) {
                            return 'formato de E-mail INVÁLIDO!';
                          }
                          if (value.length < 6) {
                            return 'o e-mail é muito curto (INVÁLIDO!)';
                          }
                          return null;
                        },
                        decoration: getLoginInputDecoration(
                            'E-Mail', Icons.mail_outline, 14, Colors.white),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (String? value) {
                          if (value == null) {
                            return 'A Senha não pode ser vazia (INVÁLIDA!) ';
                          }
                          if (value.length < 8) {
                            return 'Senha muito curta (INVÁLIDA!) ';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: getLoginInputDecoration(
                            'Senha', Icons.lock_outline, 14, Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: !queroAcessar,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (String? value) {
                                if (value == null) {
                                  return 'A Confirmação de Senha não pode ser vazia (INVÁLIDA!) ';
                                }
                                if (value.length < 8) {
                                  return 'A Confirmação de Senha é muito curta (INVÁLIDA!) ';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: getLoginInputDecoration(
                                'Confirme a Senha',
                                Icons.lock_outline,
                                14,
                                Colors.yellow,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              validator: (String? value) {
                                if (value == null) {
                                  return 'o Nome não pode ser vazio! (INVÁLIDO!)';
                                }
                                if (value.length < 3) {
                                  return 'o Nome é muito curto (INVÁLIDO!)';
                                }
                                return null;
                              },
                              decoration: getLoginInputDecoration(
                                'Nome',
                                Icons.people_alt_outlined,
                                14,
                                Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          botaoPrincipalClicado();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(queroAcessar ? 'Acessar' : 'Cadastrar'),
                        ),
                      ),
                      Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            queroAcessar = !queroAcessar;
                          });
                        },
                        child: Text(
                          queroAcessar
                              ? 'Ainda não tem uma conta? Cadastre-se!'
                              : 'já tem uma Conta? Acesse!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  botaoPrincipalClicado() {
    if (_formkey.currentState!.validate()) {
      print('Informações válidas !');
    } else {
      print('Informações Inválidas !');
    }
  }
}
