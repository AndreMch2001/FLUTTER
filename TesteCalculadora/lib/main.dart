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
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                displayText,
                style: const TextStyle(fontSize: 45.0, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TecladoW('7'),
                TecladoW('8'),
                TecladoW('9'),
                TecladoA('+'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TecladoW('4'),
                TecladoW('5'),
                TecladoW('6'),
                TecladoA('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TecladoW('1'),
                TecladoW('2'),
                TecladoW('3'),
                TecladoA('*'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TecladoW('1'),
                TecladoW('2'),
                TecladoW('3'),
                TecladoA('*'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TecladoA('C'),
                TecladoW('0'),
                TecladoA('='),
                TecladoA('/'),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class TecladoA extends StatelessWidget {
  final String text;

  TecladoA(this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Adicione aqui a lógica para lidar com os botões da calculadora
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape: CircleBorder(),
          padding: const EdgeInsets.all(35)),
      child: Text(
        text,
        style: TextStyle(fontSize: 40.0, color: Colors.black),
      ),
    );
  }
}

class TecladoW extends StatelessWidget {
  final String text;

  TecladoW(this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Adicione aqui a lógica para lidar com os botões da calculadora
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 248, 238, 207),
          shape: CircleBorder(),
          padding: const EdgeInsets.all(35)),
      child: Text(
        text,
        style: TextStyle(fontSize: 40.0, color: Colors.black),
      ),
    );
  }
}
