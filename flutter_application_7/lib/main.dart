import 'package:flutter/material.dart';
import 'package:flutter_application_7/alterar.dart';
import 'cadastro.dart';
import 'lista.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Alunos',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MaterialApp(
        initialRoute: '/',
        routes: {
          '/':(context) => Cadastro(),
          '/lista':(context) => MyLista(),
         
        },



      ),
    );
  }
}

