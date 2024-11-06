import 'package:flutter/material.dart';
import 'package:modul_3/views/home/home_page.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

bool isLoginSuccess = true;

class _LoginPagesState extends State<LoginPages> {
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        children: [_usernameField(), _passwordField(), _loginButton(context)],
      ),
    ));
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: const EdgeInsets.all(8.0),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                    color: (isLoginSuccess) ? Colors.blue : Colors.red)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.all(8.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: (isLoginSuccess) ? Colors.blue : Colors.red),
          onPressed: () {
            String text = "";
            if (password == "flutter123") {
              setState(() {
                text = "Login success!";
                isLoginSuccess = true;
              });
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomePage(username: username);
              }));
            } else {
              setState(() {
                text = "Login Failed!";
                isLoginSuccess = false;
              });
            }
            SnackBar snackBar = SnackBar(content: Text(text));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text("Login")),
    );
  }
}
