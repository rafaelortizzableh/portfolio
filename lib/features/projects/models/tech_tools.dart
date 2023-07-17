import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TechTool {
  nodeJS,
  postgres,
  flutter,
  react,
  firebase,
  googleCloud,
  aws,
  docker,
  redis,
  go,
  serverpod,
  wordpress;

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

  IconData get fontAwesomeIcon {
    switch (this) {
      case TechTool.nodeJS:
        return FontAwesomeIcons.nodeJs;
      case TechTool.postgres:
        return FontAwesomeIcons.database;
      case TechTool.flutter:
        return FontAwesomeIcons.mobile;
      case TechTool.react:
        return FontAwesomeIcons.react;
      case TechTool.firebase:
        return FontAwesomeIcons.fire;
      case TechTool.googleCloud:
        return FontAwesomeIcons.cloud;
      case TechTool.aws:
        return FontAwesomeIcons.aws;
      case TechTool.docker:
        return FontAwesomeIcons.docker;
      case TechTool.redis:
        return FontAwesomeIcons.memory;
      case TechTool.go:
        return FontAwesomeIcons.golang;
      case TechTool.serverpod:
        return FontAwesomeIcons.server;
      case TechTool.wordpress:
        return FontAwesomeIcons.wordpress;
    }
  }
}
