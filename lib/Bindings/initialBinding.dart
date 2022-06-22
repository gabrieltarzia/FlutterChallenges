import 'package:compart/Controller/home.controller.dart';
import 'package:compart/Controller/posts.controller.dart';
import 'package:get/get.dart';
import '../Controller/user.controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(PostsController());
    Get.put(UserController());
  }
}
