// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:saasgerenciamentogeprojeto/graphql_client.dart';


// class UserListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final client = GraphQLConfig.clientToQuery(); // Obtém o cliente GraphQL

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lista de Usuários'),
//       ),
//       body: Query(
//         options: QueryOptions(
//           document: gql('''
//             query BuscarUsuarios {
//               usuarios {
//                 id
//                 nome
//                 email
//               }
//             }
//           '''),
//         ),
//         builder: (QueryResult result, {fetchMore, refetch}) {
//           // Tratamento de carregamento
//           if (result.isLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           // Tratamento de erros
//           if (result.hasException) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Erro ao carregar os dados:',
//                     style: TextStyle(fontSize: 16, color: Colors.red),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     result.exception.toString(),
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       refetch!(); // Tenta recarregar os dados
//                     },
//                     child: Text('Tentar novamente'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           // Exibição dos dados
//           final usuarios = result.data?['usuarios'];

//           if (usuarios == null || usuarios.isEmpty) {
//             return Center(
//               child: Text(
//                 'Nenhum usuário encontrado.',
//                 style: TextStyle(fontSize: 16),
//               ),
//             );
//           }

//           return ListView.builder(
//             itemCount: usuarios.length,
//             itemBuilder: (context, index) {
//               final usuario = usuarios[index];
//               return ListTile(
//                 title: Text(usuario['nome']),
//                 subtitle: Text(usuario['email']),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }