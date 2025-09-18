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
      title: 'Tradutor de Portugues para Inglês',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Tradutor de Portugues para Inglês'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tradux = Tradux();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: tradux.Tradutor.length,
        itemBuilder: (BuildContext context, int index) {
          final palavra = tradux.Tradutor[index];
          return ListTile(
            leading: const Icon(Icons.translate),
            title: Text(palavra.portugues),
            subtitle: Text(palavra.ingles),
          );
        },
      ),
      //Items aqui dentro
    );
  }
}

class Palavra {

  final String portugues;
  final String ingles;

  Palavra({required this.portugues, required this.ingles});
}

class Tradux {
  List<Palavra> Tradutor = [
    Palavra(portugues:"olá", ingles:"hello"),
    Palavra(portugues: "adeus", ingles: "goodbye"),
    Palavra(portugues: "sim", ingles: "yes"),
    Palavra(portugues: "não", ingles: "no"),
    Palavra(portugues: "casa", ingles: "home"),
    Palavra(portugues: "carro", ingles: "car"),
    Palavra(portugues: "livro", ingles: "book"),
    Palavra(portugues: "estrada", ingles: "road"),
    Palavra(portugues: "computador", ingles: "computer"),
    Palavra(portugues: "código", ingles: "code"),
  ];
}