import 'package:flutter/material.dart';
import 'package:flutter_bus/models/user.dart';
import 'package:flutter_bus/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {}; // Mapa para armazenar os dados do formulário

  void _loadFormData(User user) { // Método para carregar os dados do formulário
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['cnh'] = user.cnh;
    _formData['catcnh'] = user.catcnh;
  }

  @override
  Widget build(BuildContext context) {

final User? user = ModalRoute.of(context)?.settings.arguments as User?;
if (user != null) {
  _loadFormData(user);
} // Carrega os dados do usuário se não for nulo, Caso contrário, o formulário será vazio

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        backgroundColor: Colors.blue,
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
            final isValid = _form.currentState?.validate() ?? false;
            if (!isValid) return;

            _form.currentState?.save();

            final id = _formData['id'] ?? ''; // tenta pegar o id salvo no form

            Provider.of<Users>(context, listen: false).put(
              User(
                id: id.isEmpty ? UniqueKey().toString() : id,
                name: _formData['name'] ?? '',
                email: _formData['email'] ?? '',
                cnh: _formData['cnh'] ?? '',
                catcnh: _formData['catcnh'] ?? '',
                avatar: _formData['avatar'] ?? '',
              ),
            );

            Navigator.of(context).pop();
          }
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form, // Chave do formulário
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value ?? '',
              ),
              TextFormField(
                initialValue: _formData['email'], // Preenche o campo com o valor do usuário
                decoration: const InputDecoration(labelText: 'E-mail'), // Validação do campo E-mail
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.com') ) { //metodo de validação
                    return 'Informe o e-mail correto';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value!, // Salva o valor do campo
              ),
              TextFormField(
                initialValue: _formData['cnh'], // Preenche o campo com o valor do usuário
                decoration: const InputDecoration(labelText: 'CNH'), // Validação do campo CNH
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o numero da CNH correta';
                  }
                  return null;
                },
                onSaved: (value) => _formData['cnh'] = value!, // Salva o valor do campo
              ),
              TextFormField(
                initialValue: _formData['catcnh'], // Preenche o campo com o valor do usuário
                decoration: const InputDecoration(labelText: 'Categoria da CNH'), // Validação do campo Categoria da CNH
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a categoria da CNH correta';
                  }
                  return null;
                },
                onSaved: (value) => _formData['catcnh'] = value!, // Salva o valor do campo
              ),
            ],
          ),
        ),
      ),
    );
  }
}