/*


Variant: debugAndroidTest
Config: debug
Store: C:\Users\elvis.com\.android\debug.keystore
Alias: AndroidDebugKey
MD5: 87:C9:F5:C2:C5:E9:4D:18:1D:36:F7:75:85:A8:65:54
SHA1: DF:89:2F:54:00:62:26:4E:18:30:4F:D1:E8:09:A9:A8:D0:A2:C7:CD
SHA-256: 56:7D:1D:D8:21:25:59:2B:A8:E7:68:84:3A:E9:9C:07:9D:E9:B2:87:7D:2C:D6:E4:52:A5:27:4B:F6:6C:FB:D2
Valid until: quinta-feira, 23 de maio de 2052
Valid until: quinta-feira, 23 de maio de 2052





import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          _bannerApp(),
          SizedBox(height: 30.0),
          _textTitulo(),
          _textDescripcion(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.10),
          //SizedBox(height: 30.0),
          //key: _formKey,
          _textFieldUsuario(),
          SizedBox(height: 30.0),
          _textFieldPassword(),
          SizedBox(height: 15.0),
          _textOlvidasteContrasena(),
          _buttonLogin(),
          _textNotienecuenta(),
        ],
      )),
    );
  }

// Metodo Banner

  Widget _bannerApp() {
    return Container(
      height: _headerHeight,
      child: HeaderWidget(_headerHeight, true,
          Icons.login_rounded), //let's create a common header widget
    );
  }
  //Metodo titulo

  Widget _textTitulo() {
    return Text(
      'elvis.com',
      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
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
      //margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
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
      //margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
      //child: Text('Don\'t have an account? Create'),
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




colocar icono en el splash
child: ClipOval(
child: Icon(
                  Icons.android_outlined,
                  size: 128,
                ),
                ), 



*/