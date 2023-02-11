class User {
  final String name;
  final String birth;

  User({
    required this.name,
    required this.birth,
  });

  factory User.fromMap(map) {
    return User(
      name: map['nome'],
      birth: map['nascimento']
    );
  }

  @override
  String toString() => 'nome: $name, nascimento: $birth';
}