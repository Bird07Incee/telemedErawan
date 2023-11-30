import 'package:authentication/src/component/login/login_form_component.dart';
import 'package:flutter/material.dart';
import 'package:commons/commons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ebony,
      body: _build(),
    );
  }

  Widget _build() {
    return _boxForm();
  }

  Widget _boxForm(){
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: AppSize.padding30),
        child: LoginFormComponent(),
      ),
    );
  }

}
