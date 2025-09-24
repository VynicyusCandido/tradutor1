import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        itemCount: tradux.tradutor.length,
        itemBuilder: (BuildContext context, int index) {
          final palavra = tradux.tradutor[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListTile(
              title: Text(
              palavra.foiTraduzido ? palavra.ingles : palavra.portugues,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              ),
              trailing: TextButton.icon(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8.0),
                      side: BorderSide(width: 2.0)
                    )
                  )
                ),
                label: Text(palavra.foiTraduzido ? 'Português' : 'Traduzir'),
                onPressed: (){
                  setState(() {
                    palavra.foiTraduzido = !palavra.foiTraduzido;
                  });
                },
              ),
            )
          );
        },
      ),
    );
  }
}

class Palavra {

  final String portugues;
  final String ingles;
  bool foiTraduzido;

  Palavra({
    required this.portugues,
    required this.ingles,
    this.foiTraduzido = false,
  });
}

class Tradux {
  List<Palavra> tradutor = [
    Palavra(portugues:"Olá", ingles:"Hello"),
    Palavra(portugues: "Adeus", ingles: "Goodbye"),
    Palavra(portugues: "Sim", ingles: "Yes"),
    Palavra(portugues: "Não", ingles: "No"),
    Palavra(portugues: "Casa", ingles: "Home"),
    Palavra(portugues: "Carro", ingles: "Car"),
    Palavra(portugues: "Livro", ingles: "Book"),
    Palavra(portugues: "Estrada", ingles: "Road"),
    Palavra(portugues: "Computador", ingles: "Computer"),
    Palavra(portugues: "Código", ingles: "Code"),
  ];
}