abstract class UserEntity {
  final String username;
  final String password;
  final String fullName;
  final String avatar;
  final String token;

  const UserEntity(
    this.username,
    this.password,
    this.fullName,
    this.avatar,
    this.token,
  );
}
