import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String? id;
    String nombre;
    String email;
    String rfc;
    String password;

    User({
         this.id,
         required this.nombre,
         required this.email,
         required this.rfc,
         required this.password,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["nombre"],
        email: json["email"],
        rfc: json["rfc"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "email": email,
        "rfc": rfc,
        "password": password,
    };
}
