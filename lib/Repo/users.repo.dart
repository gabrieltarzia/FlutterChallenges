import 'package:get/get.dart';

import '../Model/user.model.dart';

class UsersRepo extends GetConnect {
  Future<List<User>?> users(int? userId) async {
    List<User> userList = [];

    final response = await get("https://jsonplaceholder.typicode.com/users/");

    final users = response.body;
    for (Map user in users) {
      User u = User.fromJson(user);
      userList.add(u);
    }
    return userList;
  }

  Future<User?> userById(int? userId) async {
    User user;
    final response = await get(
        "https://jsonplaceholder.typicode.com/users/" + userId.toString());

    user = User.fromJson(response.body);

    return user;
  }
}
