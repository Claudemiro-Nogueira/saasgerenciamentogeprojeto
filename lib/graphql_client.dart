// import 'package:graphql_flutter/graphql_flutter.dart';

// class GraphQLConfig {
//   static HttpLink httpLink = HttpLink(
//     'http://localhost:8080/v1/graphql', // Endpoint do Hasura
//   );

//   static AuthLink authLink = AuthLink(
//     getToken: () async => 'Bearer ${await _getToken()}', // Token JWT
//   );

//   static Link link = authLink.concat(httpLink);

//   static GraphQLClient clientToQuery() {
//     return GraphQLClient(
//       cache: GraphQLCache(), // Gerenciamento de cache
//       link: link, // Link para conexão com o servidor
//     );
//   }

//   static Future<String> _getToken() async {
//     // Implemente a lógica para obter o token JWT (ex: do SharedPreferences)
//     return 'seu-token-jwt';
//   }
// }


import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink(
    'http://localhost:8080/v1/graphql', // Endpoint do Hasura
  );

  static AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ${await _getToken()}', // Token JWT
  );

  static Link link = authLink.concat(httpLink);

  static GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(), // Gerenciamento de cache
      link: link, // Link para conexão com o servidor
    );
  }

  static Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    if (token == null) {
      throw Exception('Token JWT não encontrado. Faça login primeiro.');
    }

    return token;
  }
}