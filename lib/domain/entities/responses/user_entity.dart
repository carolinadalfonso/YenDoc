abstract class UserEntity {
  final String username;
  final String mail;
  final String? fullName;
  final String avatar;

  const UserEntity({
    required this.username,
    required this.mail,
    this.fullName,
    required this.avatar,
  });
}
