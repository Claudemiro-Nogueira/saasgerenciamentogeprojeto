import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saasgerenciamentogeprojeto/task.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool isAdmi = true; // Verifica se o usuário é admin
  final User? user = FirebaseAuth.instance.currentUser; // Usuário logado

  List<Task> tasks = [
    Task(
      id: '1',
      title: 'Implementar Login',
      description: 'Criar tela de login com autenticação',
      assignedTo: 'João',
      status: 'A Fazer',
    ),
    Task(
      id: '2',
      title: 'Desenvolver API',
      description: 'Criar endpoints necessários',
      assignedTo: 'Maria',
      status: 'Em Progresso',
    ),
    Task(
      id: '3',
      title: 'Testes Unitários',
      description: 'Implementar testes automatizados',
      assignedTo: 'Pedro',
      status: 'Feito',
    ),
  ];

  void _addTask() {
    if (!isAdmi) return;

    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String description = '';
        String assignedTo = '';

        return AlertDialog(
          title: const Text('Nova Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Título'),
                onChanged: (value) => title = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                onChanged: (value) => description = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Atribuir para'),
                onChanged: (value) => assignedTo = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.add(Task(
                    id: DateTime.now().toString(),
                    title: title,
                    description: description,
                    assignedTo: assignedTo,
                    status: 'A Fazer',
                  ));
                });
                Navigator.pop(context);
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void _editTask(Task task) {
    if (!isAdmi) return;

    showDialog(
      context: context,
      builder: (context) {
        String title = task.title;
        String description = task.description;
        String assignedTo = task.assignedTo;

        return AlertDialog(
          title: const Text('Editar Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Título'),
                controller: TextEditingController(text: title),
                onChanged: (value) => title = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                controller: TextEditingController(text: description),
                onChanged: (value) => description = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Atribuir para'),
                controller: TextEditingController(text: assignedTo),
                onChanged: (value) => assignedTo = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  task.title = title;
                  task.description = description;
                  task.assignedTo = assignedTo;
                });
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _moveTask(Task task, String newStatus) {
    setState(() {
      task.status = newStatus;
    });
  }

  Widget _buildColumn(String status, List<Task> tasks) {
    return Expanded(
      child: Column(
        children: [
          Text(
            status,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  child: ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isAdmi)
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editTask(task),
                          ),
                        // Botões para mover a tarefa
                        if (status != 'A Fazer')
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => _moveTask(task, 'A Fazer'),
                          ),
                        if (status != 'Em Progresso')
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () => _moveTask(task, 'Em Progresso'),
                          ),
                        if (status != 'Feito')
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () => _moveTask(task, 'Feito'),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Ação ao clicar no sino
            },
          ),
          if (isAdmi)
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addTask,
            ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    user != null ? "Olá, ${user!.email}!" : "Olá, Visitante!",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Início"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Configurações"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              onTap: () async {
                await FirebaseAuth.instance.signOut(); // Faz logout
                Navigator.pushReplacementNamed(context, '/login'); // Redireciona para o login
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          _buildColumn('A Fazer', tasks.where((t) => t.status == 'A Fazer').toList()),
          _buildColumn('Em Progresso', tasks.where((t) => t.status == 'Em Progresso').toList()),
          _buildColumn('Feito', tasks.where((t) => t.status == 'Feito').toList()),
        ],
      ),
    );
  }
}