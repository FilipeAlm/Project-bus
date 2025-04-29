class User{
  final String id;
  final String name;
  final String email;
  final String cnh;
  final String catcnh;
  final String avatar;

const User({
    this.id = '', // id pode ser opcional
    required this.name, //Esses parametros são obrigatórios
    required this.email,
    required this.cnh,
    required this.catcnh,
    this.avatar = '', // avatar pode ser opcional
  });
}