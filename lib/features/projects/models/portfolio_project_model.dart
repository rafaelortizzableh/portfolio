import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'models.dart';

class PortfolioProject {
  const PortfolioProject({
    required this.title,
    required this.description,
    required this.imageLogoAssetPath,
    required this.featuredImageAssetPath,
    required this.imageAssetPaths,
    required this.techTool,
    this.extendedDescription,
    this.website,
    this.playStoreUrl,
    this.appStoreUrl,
    this.youtubeDemoUrl,
  });

  factory PortfolioProject.fromMap(Map<String, dynamic> map) {
    return PortfolioProject(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageLogoAssetPath: map['imageLogoAssetPath'] ?? '',
      featuredImageAssetPath: map['featuredImageAssetPath'] ?? '',
      imageAssetPaths: List<String>.from(map['imageAssetPaths']),
      techTool: Set<TechTool>.from(
        map['techTool'].map(
          (techTool) => TechTool.values[techTool],
        ),
      ),
      website: map['website'] != null ? Uri.parse(map['website']) : null,
      playStoreUrl:
          map['playStoreUrl'] != null ? Uri.parse(map['playStoreUrl']) : null,
      appStoreUrl:
          map['appStoreUr'] != null ? Uri.parse(map['appStoreUr']) : null,
      youtubeDemoUrl: map['youtubeDemoUrl'] != null
          ? Uri.parse(map['youtubeDemoUrl'])
          : null,
    );
  }

  factory PortfolioProject.fromJson(String source) =>
      PortfolioProject.fromMap(json.decode(source));

  final String title;
  final String description;
  final String? extendedDescription;
  final String imageLogoAssetPath;
  final String featuredImageAssetPath;
  final List<String> imageAssetPaths;
  final Set<TechTool> techTool;
  final Uri? website;
  final Uri? playStoreUrl;
  final Uri? appStoreUrl;
  final Uri? youtubeDemoUrl;

  PortfolioProject copyWith({
    String? title,
    String? description,
    String? extendedDescription,
    String? imageLogoAssetPath,
    String? featuredImageAssetPath,
    List<String>? imageAssetPaths,
    Set<TechTool>? techTool,
    Uri? website,
    Uri? playStoreUrl,
    Uri? appStoreUrl,
    Uri? youtubeDemoUrl,
  }) {
    return PortfolioProject(
      title: title ?? this.title,
      description: description ?? this.description,
      extendedDescription: extendedDescription ?? this.extendedDescription,
      imageLogoAssetPath: imageLogoAssetPath ?? this.imageLogoAssetPath,
      featuredImageAssetPath:
          featuredImageAssetPath ?? this.featuredImageAssetPath,
      imageAssetPaths: imageAssetPaths ?? this.imageAssetPaths,
      techTool: techTool ?? this.techTool,
      website: website ?? this.website,
      playStoreUrl: playStoreUrl ?? this.playStoreUrl,
      appStoreUrl: appStoreUrl ?? this.appStoreUrl,
      youtubeDemoUrl: youtubeDemoUrl ?? this.youtubeDemoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'extendedDescription': extendedDescription,
      'imageLogoAssetPath': imageLogoAssetPath,
      'featuredImageAssetPath': featuredImageAssetPath,
      'imageAssetPaths': imageAssetPaths,
      'techTool': techTool.map((x) => x.name).toList(),
      'website': website?.toString(),
      'playStoreUrl': playStoreUrl?.toString(),
      'appStoreUrl': appStoreUrl?.toString(),
      'youtubeDemoUrl': youtubeDemoUrl?.toString(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'PortfolioProject(title: $title, description: $description, extendedDescription: $extendedDescription, imageLogoAssetPath: $imageLogoAssetPath, featuredImageAssetPath: $featuredImageAssetPath, imageAssetPaths: $imageAssetPaths, techTool: $techTool, website: $website, playStoreUrl: $playStoreUrl, appStoreUrl: $appStoreUrl, youtubeDemoUrl: $youtubeDemoUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PortfolioProject &&
        other.title == title &&
        other.description == description &&
        other.extendedDescription == extendedDescription &&
        other.imageLogoAssetPath == imageLogoAssetPath &&
        other.featuredImageAssetPath == featuredImageAssetPath &&
        listEquals(other.imageAssetPaths, imageAssetPaths) &&
        setEquals(other.techTool, techTool) &&
        other.website == website &&
        other.playStoreUrl == playStoreUrl &&
        other.appStoreUrl == appStoreUrl &&
        other.youtubeDemoUrl == youtubeDemoUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        extendedDescription.hashCode ^
        imageLogoAssetPath.hashCode ^
        featuredImageAssetPath.hashCode ^
        imageAssetPaths.hashCode ^
        techTool.hashCode ^
        website.hashCode ^
        playStoreUrl.hashCode ^
        appStoreUrl.hashCode ^
        youtubeDemoUrl.hashCode;
  }
}
