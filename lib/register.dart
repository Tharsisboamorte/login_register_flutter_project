import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'login.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

String? gender;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final phoneMask = MaskTextInputFormatter(
      mask: "(##) # ####-####",
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final _registerKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
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
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 40.0, 10),
        scrollDirection: Axis.vertical,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Align(
          alignment: Alignment.center,
          heightFactor: 0.9,
          widthFactor: 1.0,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 35.0),
                child: Text("Create an account",
                    style: TextStyle(color: Colors.purple, fontSize: 30.0)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
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
                              hintText: "fulano@example.com",
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
                            inputFormatters: [phoneMask],
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.phone,
                                color: Colors.purple,
                              ),
                              label: Text("Phone"),
                              hintText: "(DD) 9 9999-9999",
                              labelStyle: TextStyle(color: Colors.purple),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5.0),
                                      right: Radius.circular(5.0))),
                            ),
                            validator: (phone){
                              if(phone == null || phone.isEmpty){
                                return "Insert phone number here";
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
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: RadioButtonWidget(),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 55.0),
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
                              builder: (context) => const Login()),
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

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({Key? key}) : super(key: key);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(
          title: const Text("Male", style: TextStyle(color: Colors.purple)),
          activeColor: Colors.purple,
          value: "male",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        const Padding(
          padding: EdgeInsets.only(right: 10.0, left: 50.0),
          child: Divider(color: Colors.purple, height: 10.0,thickness: 1.0 )),
        RadioListTile(
            title: const Text("Female", style: TextStyle(color: Colors.purple)),
            activeColor: Colors.purple,

            value: "female",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            }),
        const Padding(
            padding: EdgeInsets.only(right: 10.0, left: 50.0),
            child: Divider(color: Colors.purple, height: 10.0,thickness: 1.0 )),
        RadioListTile(
            title: const Text("Other", style: TextStyle(color: Colors.purple)),
            activeColor: Colors.purple,
            value: "other",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            }),
      ],
    );
  }
}
