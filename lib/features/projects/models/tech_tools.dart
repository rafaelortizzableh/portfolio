// ignore_for_file: sort_constructors_first

enum TechTool {
  flutter(isTopTechTool: true),
  postgres,
  nodeJS(isTopTechTool: true),
  docker,
  firebase(isTopTechTool: true),
  html,
  react(isTopTechTool: true),
  go,
  serverpod(),
  redis,
  figma(),
  wordpress,
  aws,
  googleCloud;

  final bool isTopTechTool;

  const TechTool({
    this.isTopTechTool = false,
  });

  factory TechTool.fromName(String name) {
    return TechTool.values.firstWhere(
      (e) => e.toString().toLowerCase() == name.toLowerCase(),
    );
  }
}

extension LabelExtension on TechTool {
  String get label {
    switch (this) {
      case TechTool.nodeJS:
        return 'NodeJS';
      case TechTool.postgres:
        return 'Postgres';
      case TechTool.flutter:
        return 'Flutter';
      case TechTool.react:
        return 'React';
      case TechTool.firebase:
        return 'Firebase';
      case TechTool.html:
        return 'HTML';
      case TechTool.figma:
        return 'Figma';
      case TechTool.googleCloud:
        return 'Google Cloud';
      case TechTool.aws:
        return 'AWS';
      case TechTool.docker:
        return 'Docker';
      case TechTool.redis:
        return 'Redis';
      case TechTool.go:
        return 'Go';
      case TechTool.serverpod:
        return 'Serverpod';
      case TechTool.wordpress:
        return 'Wordpress';
    }
  }
}

extension ImagesExtension on TechTool {
  String get iconAsset {
    switch (this) {
      case TechTool.nodeJS:
        return 'assets/images/tech_tools/node.webp';
      case TechTool.postgres:
        return 'assets/images/tech_tools/postgres.webp';
      case TechTool.flutter:
        return 'assets/images/tech_tools/flutter.webp';
      case TechTool.react:
        return 'assets/images/tech_tools/react.webp';
      case TechTool.firebase:
        return 'assets/images/tech_tools/firebase.webp';
      case TechTool.html:
        return 'assets/images/tech_tools/html.webp';
      case TechTool.figma:
        return 'assets/images/tech_tools/figma.webp';
      case TechTool.googleCloud:
        return 'assets/images/tech_tools/google_cloud.webp';
      case TechTool.aws:
        return 'assets/images/tech_tools/aws.webp';
      case TechTool.docker:
        return 'assets/images/tech_tools/docker.webp';
      case TechTool.redis:
        return 'assets/images/tech_tools/redis.webp';
      case TechTool.go:
        return 'assets/images/tech_tools/go.webp';
      case TechTool.serverpod:
        return 'assets/images/tech_tools/serverpod.webp';
      case TechTool.wordpress:
        return 'assets/images/tech_tools/wordpress.webp';
    }
  }
}
