import 'package:compart/Model/post.model.dart';
import 'package:get/get.dart';

class PostsRepo extends GetConnect {
  Future<List<Post>?> posts(String postId) async {
    List<Post> postList = [];

    var url = 'posts';
    final response =
        await get("https://jsonplaceholder.typicode.com/" + url + '/' + postId);

    final posts = response.body;
    for (Map post in posts) {
      Post p = Post.fromJson(post);
      postList.add(p);
    }
    return postList;
  }
}
