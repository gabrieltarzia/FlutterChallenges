import 'package:compart/Controller/home.controller.dart';
import 'package:compart/Model/comment.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/post.model.dart';

class CommentsView extends GetView<HomeController> {
  Post currentPost;

  CommentsView(this.currentPost);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Comentários')),
        ),
        body: commentList(currentPost),
      ),
    );
  }

  commentList(Post currentPost) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: FutureBuilder(
          future: controller.commentsController.commentsList(currentPost.id),
          builder: (ctx, snap) {
            switch (snap.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              default:
                if (snap.hasData) {
                  final List<Comment> comment = snap.data as List<Comment>;
                  return ListView.builder(
                      itemCount: comment.length,
                      shrinkWrap: true,
                      itemBuilder: (_, idx) {
                        return _commentCard(comment[idx]);

                        // return Text(comment[idx].name.toString());
                      });
                }
            }
            return Container();
          }),
    );
  }

  _commentCard(Comment comment) => Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text(comment.name.toString()),
              subtitle: Text(comment.email.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                comment.body.toString(),
              ),
            ),
          ],
        ),
      ));
}
