import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../Repo/users.repo.dart';
import '../Model/user.model.dart';

class UserController extends GetxController {
  UsersRepo repo = UsersRepo();

  Future<List<User>?> userList(int? userId) async => await repo.users(userId);

  Future<User?> userById(int? userId) async => await repo.userById(userId);
}
