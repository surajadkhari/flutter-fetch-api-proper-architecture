class PostResponseModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  PostResponseModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      PostResponseModel(
          id: json["id"],
          email: json["email"],
          firstName: json["first_name"] ?? 'First Name',
          lastName: json["last_name"] ?? 'Last Name',
          avatar: json["avatar"] ??
              'https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740');
}
