import 'package:flutter/material.dart';
import 'package:splashscreen/controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController controller;
  CustomLoginButtonComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.inLoading,
      builder: (_, inLoading, __) => inLoading
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                controller.auth().then(
                  (response) {
                    if (response) {
                      Navigator.of(context).pushReplacementNamed('/homePage');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro: Usuário e/ou Senha inválidos'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                );
              },
              child: const Text('Login'),
            ),
    );
  }
}
