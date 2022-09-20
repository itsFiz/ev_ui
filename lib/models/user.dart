class User {
  String? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['user']['id'].toString(),
        name: map['user']['name'],
        email: map['user']['email'],
      );
}
