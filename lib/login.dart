import 'package:flutter/material.dart';
import 'register.dart';
import 'package:email_validator/email_validator.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0,top: 60.0),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 50.0,top: 150.0),
              child: const Text("Welcome to login page",style: TextStyle(color: Colors.purple,fontSize: 25.0)),
            ),
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person_outline,color: Colors.purple),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(5.0),
                                right: Radius.circular(5.0))
                        ),
                        label: Text("Email"),
                        labelStyle: TextStyle(fontSize: 19.0, color: Colors.purple),
                      ),
                      validator: (email){
                        if(email == null || email.isEmpty){
                          return "Enter your e-mail here.";
                        } if (!EmailValidator.validate(email)){
                          return "Enter valid e-mail.";
                        }
                        return null;
                      },
                    ),
                    const Divider(height: 40.0,color: Colors.transparent),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.numbers,color: Colors.purple),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(5.0),
                                right: Radius.circular(5.0))
                        ),
                        label: Text("Password"),
                        labelStyle: TextStyle(fontSize: 19.0,color: Colors.purple),
                      ),
                      validator: (password){
                        if(password == null || password.isEmpty){
                          return "Insert your password here";
                        } else if( password.length < 8){
                          return "Password has to be bigger than 8 chars";
                        }
                        return null;
                      },
                    ),
                    const Divider(height: 40.0, color: Colors.transparent),
                    Column(
                      children: [
                        ElevatedButton(onPressed: (){
                          if(_formKey.currentState!.validate()){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Logged in")),
                            );
                          }
                        },
                          style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.purple)),
                          child: const Text("Sign in"),
                        ),
                        OutlinedButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Sign up page")),
                          );
                        },
                          child: const Text("Sign up",style: TextStyle(color: Colors.purple)),
                        ),
                      ],
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