abstract class UserEntity {
  final String username;
  final String fullName;
  final String mail;
  final String avatar;
  final String token;

  const UserEntity(
    this.username,
    this.fullName,
    this.mail,
    this.avatar,
    this.token,
  );
}
