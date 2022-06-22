
import 'package:compart/Controller/user.controller.dart';
import 'package:flutter/material.dart';
import '../../../Model/user.model.dart';

class GetUser{
  name(int? userId) {
    return FutureBuilder(
        future:UserController().userById(userId),
        builder: (ctx, snap) {
          switch (snap.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: LinearProgressIndicator(),
              );

            default:
              if (snap.hasData) {
                final user = snap.data as User;

                return Text(user.name.toString());
              }
          }
          return Container();
        });
  }

  address(int? userId) {
    return FutureBuilder(
        future: UserController().userById(userId),
        builder: (ctx, snap) {
          switch (snap.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: LinearProgressIndicator(),
              );

            default:
              if (snap.hasData) {
                final user = snap.data as User;
                final address = user.address?.street?.toString();
                final city = user.address?.city?.toString();
                return Text(address.toString() + ', ' + city.toString());
              }
          }
          return Container();
        });
  }

  companyName(int? userId) {
    return FutureBuilder(
        future: UserController().userById(userId),
        builder: (ctx, snap) {
          switch (snap.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: LinearProgressIndicator(),
              );

            default:
              if (snap.hasData) {
                final user = snap.data as User;
                final company = user.company?.name?.toString();
                return Text(company.toString());
              }
          }
          return Container();
        });
  }

}
