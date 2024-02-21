class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String githubLink;
  final String amazonLink;

  const ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.githubLink,
    required this.amazonLink,
  });
}

List<ProjectUtils> mainProjectsList = [
  const ProjectUtils(
    image: "assets/projects/social_flow_project.png",
    title: "Social Flow",
    subtitle: "This is a Social Media Application. This app fosters social interactions like enabling users to connect.",
    githubLink: "https://github.com/mohammed-swafvan/social-flow",
    amazonLink: "https://www.amazon.com/gp/product/B0CLKVSJYX",
  ),
  const ProjectUtils(
    image: "assets/projects/musician_project.png",
    title: "Musician",
    subtitle: "This is a Music Player Application. Users can utilize for organize and enjoy playlists and music collections.",
    githubLink: "https://github.com/mohammed-swafvan/musician",
    amazonLink: "https://www.amazon.com/gp/product/B0CLYBXBKX",
  ),
];
