import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../textFeilds/buttons.dart';
import '../textFeilds/tsFeilds.dart';

class LoginPge extends StatefulWidget {
  final Function() onTap;
  LoginPge({super.key, required this.onTap});

  @override
  State<LoginPge> createState() => _LoginPgeState();
}

class _LoginPgeState extends State<LoginPge> {
  final userController = TextEditingController();

  final passController = TextEditingController();

  void SignUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userController.text, password: passController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      ErrorMessage(e.code);
    }
  }

  void ErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text(message)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Login Form")),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              // icon
              Center(
                  child: Icon(
                Icons.person,
                size: 100,
                color: Colors.blue,
              )),
              SizedBox(
                height: 50,
              ),

              Text(
                'Welcome to Sigin',
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 5, 97, 151)),
              ),
              SizedBox(
                height: 50,
              ),

              // textField.....user

              TsFeilds(
                controller: userController,
                TFIcons: Icon(Icons.lock),
                hintText: 'username',
                obscoreText: false,
              ),
              SizedBox(
                height: 30,
              ),
              //textfield......pass
              TsFeilds(
                controller: passController,
                TFIcons: Icon(Icons.key),
                hintText: 'password',
                obscoreText: true,
              ),
              SizedBox(
                height: 10,
              ),
              //loginButton........
              TsButton(
                onTap: SignUser,
                txtButton: 'Sigin',
              ),
              SizedBox(
                height: 25,
              ),
              //not member register.............
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create new Accont: ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
