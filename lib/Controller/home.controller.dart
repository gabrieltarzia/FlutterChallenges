import 'package:compart/Controller/comments.controller.dart';
import 'package:get/get.dart';
import '../View/Comments/widgets/getPost.view.dart';
import '../View/HomePage/widgets/getUser.view.dart';
import 'user.controller.dart';
import 'posts.controller.dart';

class HomeController extends GetxController {
  final postController = PostsController();
  final userController = UserController();
  final commentsController = CommentsController();
  final getUser = GetUser();
 
}
