import 'package:flutter/material.dart';
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
              const Text("Register Page", style: TextStyle(color: Colors.purple, fontSize: 30.0)),
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
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5.0),
                                      right: Radius.circular(5.0))),
                            ),
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
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5.0),
                                      right: Radius.circular(5.0))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.numbers, color: Colors.purple),
                              label: Text("Password confirmation"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5.0),
                                      right: Radius.circular(5.0))),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
