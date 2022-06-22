import 'package:compart/Controller/comments.controller.dart';
import 'package:compart/Model/comment.model.dart';
import 'package:compart/View/Comments/comments.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/home.controller.dart';
import '../../Model/post.model.dart';
import '../Comments/widgets/getPost.view.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Postagens')),
        ),
        body: _postList(),
      ),
    );
  }

  _postList() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: FutureBuilder(
          future: controller.postController.postList(),
          builder: (ctx, snap) {
            switch (snap.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              default:
                if (snap.hasData) {
                  final List<Post> post = snap.data as List<Post>;

                  return ListView.builder(
                      itemCount: post.length,
                      shrinkWrap: true,
                      itemBuilder: (_, idx) {
                        return _postCard(post[idx]);
                      });
                }
            }
            return Container();
          }),
    );
  }

  _commentButton(Post post) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.mode_comment),
          alignment: Alignment.center,
          iconSize: 44,
          tooltip: 'Ver Comentários',
          onPressed: () {
            Get.to(() => CommentsView(post));
          },
        ),
      ],
    );
  }

  _postCard(Post post) => Card(
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
            Text(
              post.title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            ListTile(
              trailing: _commentButton(post),
              title: controller.getUser.name(post.userId),
              subtitle: controller.getUser.companyName(post.userId),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                post.body.toString(),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            controller.getUser.address(post.userId),
          ],
        ),
      ));
}
