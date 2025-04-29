import 'package:flutter/material.dart';
import 'package:flutter_bus/provider/users.dart';
import 'package:flutter_bus/routes/app_routes.dart';
import 'package:flutter_bus/views/user_form.dart';
import 'package:flutter_bus/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
        child: MaterialApp(
        title: 'Driver Bus',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: { //definindo rotas
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}