class UserModel {
  String? username;
  String? password;
  String? email;
  String? firstName;
  String? lastName;
  UserModel(
      {this.username,
      this.password,
      this.email,
      this.firstName,
      this.lastName});

  static UserModel fromJson(Map json) {
    return UserModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      password: json['password'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'firstName': firstName,
        'password': password,
        'username': username,
        'lastName': lastName
      };
}
