import 'dart:convert';
import '../model/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Future<List<User>> getUsers() async {
    // Данный код используется для выполнения HTTP GET запроса к внешнему API и получения ответа.
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      // декодируем json ответ в список dynamic
      final List<dynamic> userJson = json.decode(response.body);

      // метод map применяет функцию, которая преобразует каждый элемент
      // списка JSON в объект типа User, используя статический метод
      // fromJson класса User.

      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}
