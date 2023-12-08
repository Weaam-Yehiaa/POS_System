class UserModel {
  String? email, name, restaurantID, uID, role;

  UserModel(
      this.email,
      this.name,
      this.role,
      this.restaurantID,
      this.uID,
      );

  UserModel.fromJson(json)
  {
    email = json['email'];
    name = json['name'];
    restaurantID = json['restaurantID'];
    uID=json['uID'];
    role=json['role'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'restaurantID': restaurantID,
      'uID':uID,
      'role':role,
    };
  }
}