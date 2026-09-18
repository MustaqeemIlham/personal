class Project {
  final String title;
  final String technologies;
  final String description;
  final String achievement;
  final String? githubUrl;
  final String? demoUrl;

  const Project({
    required this.title,
    required this.technologies,
    required this.description,
    required this.achievement,
    this.githubUrl,
    this.demoUrl,
  });
}
