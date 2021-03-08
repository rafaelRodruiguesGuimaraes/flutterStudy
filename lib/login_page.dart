import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  handleButton() {
    if (email == 'rafarodgui@hotmail.com' && password == '123456') {
      Navigator.of(context).pushReplacementNamed('/home');
    } else if (email.length <= 0 || password.length <= 0) {
      print('Empty');
    } else {
      print('Wrong e-mail or password!');
    }
  }

  Widget _body() {
    return Column(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/logos/logo.png')),
                  Container(
                    height: 50,
                  ),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 12, bottom: 12, left: 12),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (text) {
                            email = text;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'E-mail'),
                        ),
                        Container(
                          height: 10.0,
                        ),
                        TextField(
                          onChanged: (text) {
                            password = text;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Senha'),
                        ),
                        Container(
                          height: 10.0,
                        ),
                        RaisedButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          onPressed: () {
                            handleButton();
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'Entrar',
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                  )),
                  Container(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/images/login_background.jpg',
                  fit: BoxFit.cover)),
          Container(color: Colors.black.withOpacity(0.7)),
          _body(),
        ],
      ),
    );
  }
}
