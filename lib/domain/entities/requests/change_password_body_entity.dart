abstract class ChangePasswordBodyEntity {
  final String password;
  final String newPassword;

  const ChangePasswordBodyEntity(
    this.password,
    this.newPassword,
  );
}
