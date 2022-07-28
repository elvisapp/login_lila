import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_lila/src/pages/login/login_page.dart';
import 'package:login_lila/src/pages/profile_page.dart';
import 'package:provider/provider.dart';

class RedesController {
  BuildContext? context;
  Future? init(BuildContext context) {
    this.context = context;
  }

  routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   try {
  //     final userCredential = await FirebaseAuth.instance.signInWithCustomToken;
  //     print("Sign-in successful.");
  //   } on FirebaseAuthException catch (e) {
  //     switch (e.code) {
  //       case "invalid-custom-token":
  //         print("The supplied token is not a Firebase custom auth token.");
  //         break;
  //       case "custom-token-mismatch":
  //         print("The supplied token is for a different Firebase project.");
  //         break;
  //       default:
  //         print("Unkown error.");
  //     }
  //   }

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
