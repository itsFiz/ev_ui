class User {
  String? id;
  String? idno;
  String? name;
  String? email;
  bool? verified;

  User({this.id, this.idno, this.name, this.email, this.verified});

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['user']['id'].toString(),
        idno: map['user']['identity_no'],
        name: map['user']['name'],
        email: map['user']['email'],
        verified: map['user']['verified'],
      );
}
