import 'package:compart/Model/post.model.dart';
import 'package:compart/Repo/posts.repo.dart';
import 'package:get/get.dart';
import '../Repo/users.repo.dart';

class PostsController extends GetxController {
  PostsRepo repo = PostsRepo();
  UsersRepo userRepo = UsersRepo();

  Future<List<Post>?> postList() async => await repo.posts('');
  Future<List<Post>?> postById(String postId) async => await repo.posts(postId);
}
