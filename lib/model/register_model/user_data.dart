class UserData {
  final String name;
  final String email;
  final String password;
  final String phone;
  final int avaterId;
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const UserData({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avaterId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json['_id'].toString(),
        email: json['email'].toString(),
        name: json['name'].toString(),
        password: json['password'].toString(),
        phone: json['phone'].toString(),
        avaterId: json['avaterId'] ?? 2,
        createdAt:
            DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now(),
        updatedAt:
            DateTime.tryParse(json['updatedAt'].toString()) ?? DateTime.now(),
        v: json['__v'] ?? 0,

        //   email: json['email'] as String,
        //   password: json['password'] as String,
        //   name: json['name'] as String,
        //   phone: json['phone'] as String,
        //   avaterId: json['avaterId'] as int,
        //   id: json['_id'] as String,
        //   createdAt: DateTime.parse(json['createdAt'] ),
        //   updatedAt: DateTime.parse(json['updatedAt'] ),
        //   v: json['__v'] as int,
      );

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'avaterId': avaterId,
      '_id': id,
      'createdAt': createdAt!.toIso8601String(),
      'updatedAt': updatedAt!.toIso8601String(),
      '__v': v,
    };
  }

// for update user info
  UserData copyWith({String? name, int? avatar, String? phone}) {
    return UserData(
      name: name ?? this.name,
      avaterId: avatar ?? this.avaterId,
      phone: phone ?? this.phone,
      email: email,
      id: this.id,
      password: this.password,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      v: this.v,
    );
  }
}
