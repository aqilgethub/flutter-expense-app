import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../textFeilds/buttons.dart';
import '../textFeilds/tsFeilds.dart';

class SigUpPage extends StatefulWidget {
  final Function() onTap;
  SigUpPage({super.key, required this.onTap});

  @override
  State<SigUpPage> createState() => _SigUpPageState();
}

class _SigUpPageState extends State<SigUpPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  final CofirmpassController = TextEditingController();

  void SigUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (passController.text == CofirmpassController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: userController.text, password: passController.text);
      } else {
        WrongMessage("Password not match");
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      WrongMessage(e.code);
    }
  }

  void WrongMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text(message)),
          );
        });
  }

  void regigterUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Register Form")),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              // icon
              Center(child: Icon(Icons.person, size: 100, color: Colors.blue)),
              SizedBox(
                height: 30,
              ),

              Text(
                'Create User',
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 5, 97, 151)),
              ),
              SizedBox(
                height: 30,
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
              //Confirm Password
              SizedBox(
                height: 20,
              ),
              //textfield......pass
              TsFeilds(
                controller: CofirmpassController,
                TFIcons: Icon(Icons.key),
                hintText: 'Confirm password',
                obscoreText: true,
              ),
              SizedBox(
                height: 10,
              ),

              //forgetpass
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //loginButton........
              TsButton(
                onTap: SigUser,
                txtButton: 'Sig Up',
              ),
              SizedBox(
                height: 50,
              ),

              //not member register.............
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'All ready have an Accont: ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login',
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
