class User {
  final String uid;
  final String email;
  final String? displayName;
  final String? avatar;

  const User({
    required this.uid,
    required this.email,
    this.displayName,
    this.avatar,
  });
}
