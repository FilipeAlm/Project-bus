import 'dart:math';
import 'package:flutter/material.dart';
import '/data/dummy_users.dart';
import 'package:flutter_bus/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};
  
  List<User> get all{
   return [..._items.values]; //"Clone" da lista para "proteger" a lista original.
  }

  int get count {
    return _items.length; //Método para contar quantos itens estão na lista.
  }
  User byIndex(int i) {
    return _items.values.elementAt(i); //Método para buscar na lista
  }

  void put(User user){

    if (
    user.id.trim().isNotEmpty &&
    _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          cnh: user.cnh,
          catcnh: user.catcnh,
          avatar: user.avatar,
          ),
        );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          cnh: user.cnh,
          catcnh: user.catcnh,
          avatar: user.avatar,
          )
        ); //Adiciona o novo usuário na lista.
    }
    notifyListeners(); //Notifica o usuário que a lista foi alterada.
    }
    void remove(User user) {
    if (user.id.isNotEmpty) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}