import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/constants/app_sizes.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Auxílio Emergencial - Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            gapH32,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: Strings.labelUsuario, hintText: Strings.hintUsuario),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: Strings.labelSenha, hintText: Strings.hintSenha),
              ),
            ),
            SizedBox(
              height: 65,
              width: 460,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    child: Text(
                      Strings.login,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      context.goNamed(AppRoute.home.name);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 62),
                    child: Text(Strings.esqueceuInfo),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: InkWell(
                        onTap: () {
                          print('abrir ajuda');
                        },
                        child: Text(
                          Strings.ajudaLogar,
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        )),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
