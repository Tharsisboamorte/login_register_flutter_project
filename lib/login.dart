import 'package:flutter/material.dart';
import 'register.dart';
import 'package:email_validator/email_validator.dart';


bool passwordValid = false;
bool emailValid = false;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 50.0, top: 150.0),
                child: const Text("Welcome to login page",
                    style: TextStyle(color: Colors.purple, fontSize: 25.0)),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          icon: Icon(
                              Icons.person_outline, color: Colors.purple),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(5.0),
                                  right: Radius.circular(5.0))
                          ),
                          label: Text("Email"),
                          hintText: "fulano@exemplo.com",
                          labelStyle: TextStyle(
                              fontSize: 19.0, color: Colors.purple),
                        ),
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            emailValid = false;
                            return "Enter your e-mail here.";
                          }
                          if (!EmailValidator.validate(email)) {
                            emailValid = false;
                            return "Enter valid e-mail.";
                          }
                          emailValid = true;
                          return null;
                        },
                      ),
                      const Divider(height: 40.0, color: Colors.transparent),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.numbers, color: Colors.purple),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(5.0),
                                  right: Radius.circular(5.0))
                          ),
                          label: Text("Password"),
                          labelStyle: TextStyle(
                              fontSize: 19.0, color: Colors.purple),
                        ),
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            passwordValid = false;
                            return "Insert your password here";
                          } else if (password.length < 8) {
                            passwordValid = false;
                            return "Password has to be bigger than 8 chars";
                          }
                          passwordValid = true;
                          return null;
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(
                            25.0, 30.0, 25.0, 20.0),
                        child: Column(
                          children: [
                            Padding(padding: const EdgeInsets.only(top: 30.0),
                              child: ElevatedButton(onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Logged in")),
                                  );
                                } else {
                                  passwordValid ? false : _passwordController
                                      .clear();
                                  emailValid ? false : _emailController.clear();
                                }
                              },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    minimumSize: const Size.fromHeight(50)
                                ),
                                child: const Text("Sign in"),
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: OutlinedButton(onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Register()
                                    ));
                              },
                                style: OutlinedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50)
                                ),
                                child: const Text("Sign up", style: TextStyle(
                                    color: Colors.purple)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        )
    );
  }
}