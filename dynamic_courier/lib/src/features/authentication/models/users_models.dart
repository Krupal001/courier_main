class UserModel{
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password
  });

  toJson(){
    return {
      "Name":name,
      "Email":email,
      "Phone no":phone,
      "Password":password,

    };

    }
}