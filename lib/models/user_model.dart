class UserModel {
  final String? id;
  final String? name;
  final String? jurusan;
  final String? email;
  final String? token;
  final String? password;

  UserModel({
    this.id,
    this.name,
    this.jurusan,
    this.email,
    this.token,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      name: json['name'],
      jurusan: json['jurusan'],
      email: json['email'],
      token: json['token']);

  UserModel copyWith({
    String? name,
    String? jurusan,
    String? email,
    String? password,
  }) =>
      UserModel(
          id: id,
          name: name ?? this.name,
          jurusan: jurusan ?? this.jurusan,
          email: email ?? this.email,
          password: password ?? this.password,
          token: token);
}
