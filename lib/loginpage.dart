import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projet_iai/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mysql1/mysql1.dart';

import 'login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Future<String> userLogin(String username, String password) async {
    final response = await http.post(
        Uri.parse("http://127.0.0.1:5000/API_FLASK/login"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"username": username, "password": password}));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Erreur lors de la connexion";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                Color.fromARGB(253, 250, 103, 4),
                Color.fromARGB(255, 132, 133, 197),
                Color.fromARGB(206, 2, 26, 2),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0,
              ),
              Image.asset(''),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 600,
                width: 325,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text('Bonjour!',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez saisir votre nom d\'utilisateur';
                          }
                          return null;
                        },
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                          hintText: 'Nom ',
                          suffixIcon: Icon(
                            FontAwesomeIcons.user,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez saisir votre mot de passe';
                          }
                          return null;
                        },
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Mot de passe',
                          suffixIcon: Icon(
                            FontAwesomeIcons.eyeSlash,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Mot de passe oublié?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 27, 14, 3)),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          userLogin(
                            usernamecontroller.text,
                            passwordcontroller.text,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()));
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(253, 250, 103, 4),
                                  Color.fromARGB(255, 132, 133, 197),
                                  Color.fromARGB(206, 2, 26, 2),
                                ])),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Se connecter',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
