import 'package:compart/Model/comment.model.dart';
import 'package:compart/Repo/comments.repo.dart';
import 'package:get/get.dart';

class CommentsController extends GetxController {
  CommentsRepo repo = CommentsRepo();

  Future<List<Comment?>?> commentsList(int? postId) async =>
      await repo.comments(postId);
}
