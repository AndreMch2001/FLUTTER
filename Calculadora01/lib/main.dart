import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget botao(String texto, Color corBotao, Color corTexto) {
    return Container(
        child: ElevatedButton(
            onPressed: () {
              //Method
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: corBotao,
              shape: CircleBorder(),
            ),
            child: Text(
              texto,
              style: TextStyle(
                fontSize: 30,
                color: corTexto,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'CALCULADORA',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                    height: 200,
                    color: Colors.black,
                    child: const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '0',
                            style:
                                TextStyle(color: Colors.white, fontSize: 100),
                            textAlign: TextAlign.right,
                          ),
                        ))),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botao('AC', Colors.grey, Colors.black),
              botao('+/-', Colors.grey, Colors.black),
              botao('%', Colors.grey, Colors.black),
              botao('÷', Colors.grey, Colors.black),
            ],
          ),
        ]));
  }
}

class Botoes extends StatelessWidget {
  String text;
  double sizeBotom;
  double sizePadding;
  Botoes(this.text, this.sizeBotom, this.sizePadding);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // Adicione aqui a lógica para lidar com os botões da calculadora
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(sizePadding),
          shape: CircleBorder(),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: sizeBotom, color: Colors.black),
        ));
  }
}
