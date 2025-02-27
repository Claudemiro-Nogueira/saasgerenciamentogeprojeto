import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saasgerenciamentogeprojeto/firebase_options.dart';
import 'package:saasgerenciamentogeprojeto/home_screen.dart';
import 'login_screen.dart'; // Certifique-se de que este arquivo existe e está correto

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que o Flutter esteja inicializado
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Inicializa o Firebase
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Construtor com key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trello App', // Título do app
      initialRoute: '/login', // Rota inicial
      routes: {
        '/login': (context) => const LoginScreen(), // Rota para a tela de login
        '/home': (context) =>  HomeScreen(), // Rota para a tela inicial
        // '/listar': (context) =>  UserListScreen(), // Rota para a tela de listagem
      },
    );
  }
}
