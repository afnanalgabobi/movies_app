class UpdateProfileRequest {
  final String email;
  final int avaterId;
  String name;
  String phone;

  UpdateProfileRequest(
      {required this.email,
      required this.avaterId,
      required this.name,
      required this.phone});

  Map<String, dynamic> toJson() =>
      {'email': email, 'avaterId': avaterId, 'name': name, 'phone': phone};
}
