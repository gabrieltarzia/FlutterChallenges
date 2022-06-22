import 'package:compart/Controller/comments.controller.dart';
import 'package:compart/Model/comment.model.dart';
import 'package:flutter/material.dart';

import '../../../Controller/user.controller.dart';
import '../../../Model/user.model.dart';

class GetPost {
  name(int? userId) {
    FutureBuilder(
        future: UserController().userById(userId),
        builder: (ctx, snap) {
          switch (snap.connectionState) {
            case ConnectionState.waiting:
              return const Text(''
               // child: LinearProgressIndicator(),
              );

            default:
              if (snap.hasData) {
                final user = snap.data as User;

                return Text(user.name.toString());
              }
          }
          return Text('data');
          //return Container();
        });
  }
}
