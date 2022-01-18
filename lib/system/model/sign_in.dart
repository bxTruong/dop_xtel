class SignIn {
  String? password;
  String? userName;

  SignIn({this.password, this.userName});

  SignIn.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['userName'] = this.userName;
    return data;
  }
}
