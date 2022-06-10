import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:login_lila/src/common/theme_helper.dart';

import '../forgot_password_page.dart';
import '../profile_page.dart';
import '../register/registration_page.dart';
import '../widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 186, 25, 207),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black, Colors.purple, Colors.lightBlue])),
          child: Column(
            children: [
              _bannerApp(),
              const SizedBox(height: 30.0),
              _textTitulo(),
              _textDescripcion(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.11),
              //key: _formKey,
              _textFieldUsuario(),
              const SizedBox(height: 30.0),
              _textFieldPassword(),
              const SizedBox(height: 15.0),
              _textOlvidasteContrasena(),
              _buttonLogin(),
              _textNotienecuenta(),
            ],
          ),
        )),
      ),
    );
  }

// Metodo Banner

  Widget _bannerApp() {
    return ClipPath(
      clipper: WaveClipperOne(),
      child: Container(
          color: Colors.purple,
          height: MediaQuery.of(context).size.height * 0.30,
          //height: _headerHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/img/logo_app.png',
                width: 150,
                height: 100,
              ),
            ],
          ) //let's create a common header widget
          ),
    );
  }
  //Metodo titulo

  Widget _textTitulo() {
    return Text(
      'elvis.com',
      style: TextStyle(
          fontFamily: 'Roboto', fontSize: 50, fontWeight: FontWeight.bold),
    );
  }

  //Metodo descripcion
  Widget _textDescripcion() {
    return Text(
      'Inicia sesión en tu cuenta',
      style: TextStyle(color: Colors.grey),
    );
  }

  //Metodo ingrese usuario
  Widget _textFieldUsuario() {
    return Container(
      // ignore: sort_child_properties_last
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: ThemeHelper()
            .textInputDecoration('Nombre de usuario', 'Enter your user name'),
      ),
      decoration: ThemeHelper().inputBoxDecorationShaddow(),
    );
  }

  //Metodo password
  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: TextField(
        obscureText: true,
        decoration: ThemeHelper()
            .textInputDecoration('Password', 'Enter your password'),
      ),
      decoration: ThemeHelper().inputBoxDecorationShaddow(),
    );
  }

  //Metodo olvidaste contraseña

  Widget _textOlvidasteContrasena() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
          );
        },
        child: Text(
          "Olvidaste tu contraseña?",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  //Metodo ButtonLogin
  Widget _buttonLogin() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
        style: ThemeHelper().buttonStyle(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Text(
            'Entrar'.toUpperCase(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        onPressed: () {
          //After successful login we will redirect to profile page. Let's create profile page now
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
    );
  }

  //Metodo no tiene cuenta
  Widget _textNotienecuenta() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "No tienes cuenta? "),
        TextSpan(
          text: 'Crear',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()));
            },
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor),
        ),
      ])),
    );
  }
}
