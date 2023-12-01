import 'package:authentication/authentication.dart';
import 'package:authentication/src/component/login/login_form_component.dart';
import 'package:flutter/material.dart';
import 'package:commons/commons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(context: context),
      lazy: true,
      builder: (context, _) {
        return _LoginScreen(
          loginProv: context.watch<LoginProvider>(),
        );
      },
    );
  }
}

class _LoginScreen extends StatefulWidget {
  final LoginProvider loginProv;

  const _LoginScreen({
    super.key,
    required this.loginProv,
  });

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return _build();
  }

  Widget _build() {
    return _boxForm();
  }

  Widget _boxForm() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: AppSize.padding30),
        child: LoginFormComponent(
          onSubmit: _onTapSubmit,
        ),
      ),
    );
  }

  void _onTapSubmit() async {
    widget.loginProv.goAm();
  }
}
