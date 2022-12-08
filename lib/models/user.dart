class User {
  String? id;
  String? name;
  String? email;
  bool? verified;

  User({this.id, this.name, this.email, this.verified});

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['user']['id'].toString(),
        name: map['user']['name'],
        email: map['user']['email'],
        verified: map['user']['verified'] == 0 ? false : true,
      );
}
