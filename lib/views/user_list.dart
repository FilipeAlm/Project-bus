import 'package:flutter/material.dart';
import 'package:flutter_bus/componets/user_tile.dart';
import 'package:flutter_bus/provider/users.dart';
import 'package:flutter_bus/routes/app_routes.dart';
import 'package:provider/provider.dart';


class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of<Users>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Motoristas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}