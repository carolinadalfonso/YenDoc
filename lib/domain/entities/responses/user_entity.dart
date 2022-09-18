abstract class UserEntity {
  final String username;
  final String mail;
  final String fullName;
  final String avatar;

  const UserEntity({
    required this.username,
    required this.mail,
    required this.fullName,
    required this.avatar,
  });
}
