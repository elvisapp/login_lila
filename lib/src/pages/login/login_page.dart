import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:login_lila/src/common/theme_helper.dart';
import 'package:login_lila/src/pages/login/login_controller.dart';
import '../forgot_password_page.dart';
import '../register/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final LoginController _to = LoginController();

  @override
  Widget build(BuildContext context) {
    _to.int(context);
    return Scaffold(
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
              textItem("Email", _to.emailController, false),
              const SizedBox(height: 30.0),
              textItem("Password", _to.passwordController, true),
              const SizedBox(height: 15.0),
              _textOlvidasteContrasena(),
              _buttonLogin(),
              _textNotienecuenta(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.11,
              ),
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

  Widget textItem(
      String name, TextEditingController controller, bool obsecureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obsecureText,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: name,
          labelStyle: const TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1.5,
              color: Colors.amber,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
      ),
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
        onPressed: () async {
          //if (_formKey.currentState!.validate()) {
          _to.controllerLogin(context);
          // }
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
