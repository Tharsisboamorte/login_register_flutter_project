import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _registerKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 30.0, 40.0, 10),
        scrollDirection: Axis.vertical,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Align(
          alignment: Alignment.center,
          heightFactor: 0.9,
          widthFactor: 1.0,
          child: Column(
            children: <Widget>[
              const Text("Create an account",
                  style: TextStyle(color: Colors.purple, fontSize: 30.0)),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Form(
                    key: _registerKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.person_outline,
                              color: Colors.purple,
                            ),
                            label: Text("Name"),
                            labelStyle: TextStyle(color: Colors.purple),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(5.0),
                                    right: Radius.circular(5.0))),
                          ),
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return "Insert your name here";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.purple,
                              ),
                              label: Text("Email"),
                              labelStyle: TextStyle(color: Colors.purple),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5.0),
                                      right: Radius.circular(5.0))),
                            ),
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return "Enter your e-mail here.";
                              }
                              if (!EmailValidator.validate(email)) {
                                return "Enter valid e-mail.";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.numbers, color: Colors.purple),
                              label: Text("Password"),
                              labelStyle: TextStyle(color: Colors.purple),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5.0),
                                      right: Radius.circular(5.0))),
                            ),
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return "Insert your password here";
                              } else if (password.length < 8) {
                                return "Password has to be bigger than 8 chars";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: TextFormField(
                            controller: _passwordCheckController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.numbers, color: Colors.purple),
                              label: Text("Password confirmation"),
                              labelStyle: TextStyle(color: Colors.purple),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5.0),
                                      right: Radius.circular(5.0))),
                            ),
                            validator: (passwordConfirm) {
                              if (passwordConfirm == null ||
                                  passwordConfirm.isEmpty ||
                                  passwordConfirm != _passwordController.text) {
                                return "Repeat first password here.";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_registerKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Account created")),
                          );
                        }
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.purple)),
                      child: const Text("Create an account"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()
                            ),
                        );
                      },
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent),
                      ),
                      child: const Text("Already have an account?",
                          style: TextStyle(
                              color: Colors.purple,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
