class User {
  final String imagePath;
  final String name;
  final String email;
  final String medInstitution;
  final String specialty;
  final String about;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.medInstitution,
    required this.specialty,
    required this.about,
    required this.isDarkMode,
  });
}
