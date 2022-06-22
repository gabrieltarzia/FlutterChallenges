import 'package:get/get.dart';
import '../Model/comment.model.dart';

class CommentsRepo extends GetConnect {
  Future<List<Comment?>?> comments(int? postId) async {
    List<Comment> commentList = [];

    final response = await get('https://jsonplaceholder.typicode.com/posts/' +
        postId.toString() +
        '/comments/');

    final comments = response.body;

    for (Map comment in comments) {
      Comment c = Comment.fromJson(comment);
      commentList.add(c);
    }

    return commentList;
  }
}
