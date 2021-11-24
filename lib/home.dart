import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Map<String, dynamic> userCredentials = {
    'username': 'fabio',
    'password': 'fabio123'
  };

  var isLogged = false;
  var loginMessage = '';

  void login(username, password) {
    if (userCredentials['username'] == username &&
        userCredentials['password'] == password) {
      setState(() {
        isLogged = true;
        loginMessage = "O usuário está logado.";
      });
    } else {
      setState(() {
        loginMessage = "Este usuário não existe.";
      });
    }
  }

  void logoff() {
    setState(() {
      isLogged = false;
      loginMessage = "Usuário deslogado com sucesso.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Prova 02 | Login - Fábio Carvalho'),
        ),
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(100, 100, 100, 0.5),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: SizedBox(
                    width: 300,
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: (Text("Painel",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)))),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 14),
                                labelText: 'Usuário',
                              ),
                              controller: username,
                              textAlign: TextAlign.center,
                              enabled: isLogged ? false : true,
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(fontSize: 14),
                                labelText: 'Senha',
                              ),
                              controller: password,
                              textAlign: TextAlign.center,
                              enabled: isLogged 
                              ? false 
                              : true,
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 20),
                            child: Center(
                                child: (
                                  OutlinedButton(
                                    child: isLogged
                                        ? const Text(
                                            'Logoff',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.redAccent
                                            ),                                          
                                            textAlign: TextAlign.center,
                                          )
                                        : const Text(
                                            'Login',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green),
                                            textAlign: TextAlign.center,
                                          ),
                              onPressed: () {
                                isLogged
                                    ? logoff()
                                    : login(username.text, password.text);
                              },
                            )))),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: (Text(
                              loginMessage,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )))
                      ]),
                    )))));
  }
}
