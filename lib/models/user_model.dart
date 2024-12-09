class UserModel {
  final String? id;
  final String? name;
  final String? jurusan;
  final String? email;
  final String? token;
  final String? password;
  final String? consoleId;

  UserModel({
    this.id,
    this.name,
    this.jurusan,
    this.email,
    this.token,
    this.password,
    this.consoleId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        jurusan: json['jurusan'],
        email: json['email'],
        token: json['token'],
        consoleId: json['consoleId'],
      );

  UserModel copyWith({
    String? name,
    String? jurusan,
    String? email,
    String? password,
    String? consoleId,
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        jurusan: jurusan ?? this.jurusan,
        email: email ?? this.email,
        password: password ?? this.password,
        token: token,
        consoleId: consoleId,
      );
}
