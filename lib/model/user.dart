

class User {
  int id;
  String username;
  String avatar;


  User.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.username = json['username'];
    this.avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['id'] = this.id;
    json['username'] = this.username;
    json['avatar'] = this.avatar;
    return json;
  }

  @override
  String toString() => 'User {id: $id, username: $username}';
}

