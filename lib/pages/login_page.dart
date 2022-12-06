import 'package:flutter/material.dart';
import 'package:splashscreen/components/login/custom_login_button_component.dart';
import 'package:splashscreen/controllers/login_controller.dart';
import 'package:splashscreen/widgets/custom_textfield_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.javascript,
              size: MediaQuery.of(context).size.height * 0.2,
            ),
            CustomTextfieldWidget(
              onChanged: _controller.setLogin,
              label: 'Login',
            ),
            CustomTextfieldWidget(
              onChanged: _controller.setPassword,
              label: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 48),
            CustomLoginButtonComponent(
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
