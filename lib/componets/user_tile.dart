import 'package:flutter/material.dart';
import 'package:flutter_bus/models/user.dart';
import 'package:flutter_bus/provider/users.dart';
import 'package:flutter_bus/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);
  @override
  Widget build(BuildContext context) {
    // Definindo o avatar com base na URL ou fallback para ícone de pessoa
    final avatar = user.avatar.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatar));
    return ListTile(
      leading: avatar, // Coloca o avatar na posição de "leading"
      title: Text(user.name), // Exibe o nome do usuário
      subtitle:
          Text(user.email + user.catcnh), // Exibe o e-mail e a categoria da CNH

      onTap: () {},
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            //Botão editar
            icon: Icon(Icons.edit),
            color: Colors.orange,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM,
                  arguments:
                      user // Passa o usuário como argumento para a rota de formulário
                  );
            },
          ),
          IconButton(
            //Botão excluir
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              showDialog(
                context: context,
                builder: ((ctx) => AlertDialog(
                      title: Text('Excluir usuário'),
                      content:
                          Text('Tem certeza que deseja excluir o usuário?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Não'),
                          onPressed: () {
                            Navigator.of(ctx).pop(); // Fecha o diálogo
                          },
                        ),
                        TextButton(
                          child: Text('Sim'),
                          onPressed: () {
                            Provider.of<Users>(context, listen: false)
                                .remove(user); // Deleta o usuário
                            Navigator.of(ctx).pop(); // Fecha o diálogo
                          },
                        ),
                      ],
                    )),
              ); // Exibe o diálogo de confirmação
            },
          ),
        ]),
      ),
    );
  }
}
