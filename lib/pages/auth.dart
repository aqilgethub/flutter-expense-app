import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/sigin.dart';
import '../pages/signup.dart';
import '../pages/signin_or_signup.dart';
import '../pages/landingPage.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            // is user logged
            if (snapshot.hasData) {
              return LandingPage();
            }

            // or NOT logged
            else {
              return SigniOrSignUp();
            }
          }),
        ),
      ),
    );
  }
}
