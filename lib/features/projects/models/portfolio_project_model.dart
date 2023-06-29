import 'dart:convert';

import 'package:flutter/foundation.dart';

class PortfolioProject {
  const PortfolioProject({
    required this.title,
    required this.description,
    required this.imageLogoAssetPath,
    required this.featuredImageAssetPath,
    required this.imageAssetPaths,
    this.website,
    this.playStoreUrl,
    this.appStoreUr,
  });

  factory PortfolioProject.fromMap(Map<String, dynamic> map) {
    return PortfolioProject(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageLogoAssetPath: map['imageLogoAssetPath'] ?? '',
      featuredImageAssetPath: map['featuredImageAssetPath'] ?? '',
      imageAssetPaths: List<String>.from(map['imageAssetPaths']),
      website: map['website'] != null ? Uri.parse(map['website']) : null,
      playStoreUrl:
          map['playStoreUrl'] != null ? Uri.parse(map['playStoreUrl']) : null,
      appStoreUr:
          map['appStoreUr'] != null ? Uri.parse(map['appStoreUr']) : null,
    );
  }

  factory PortfolioProject.fromJson(String source) =>
      PortfolioProject.fromMap(json.decode(source));

  final String title;
  final String description;
  final String imageLogoAssetPath;
  final String featuredImageAssetPath;
  final List<String> imageAssetPaths;
  final Uri? website;
  final Uri? playStoreUrl;
  final Uri? appStoreUr;

  PortfolioProject copyWith({
    String? title,
    String? description,
    String? imageLogoAssetPath,
    String? featuredImageAssetPath,
    List<String>? imageAssetPaths,
    Uri? website,
    Uri? playStoreUrl,
    Uri? appStoreUr,
  }) {
    return PortfolioProject(
      title: title ?? this.title,
      description: description ?? this.description,
      imageLogoAssetPath: imageLogoAssetPath ?? this.imageLogoAssetPath,
      featuredImageAssetPath:
          featuredImageAssetPath ?? this.featuredImageAssetPath,
      imageAssetPaths: imageAssetPaths ?? this.imageAssetPaths,
      website: website ?? this.website,
      playStoreUrl: playStoreUrl ?? this.playStoreUrl,
      appStoreUr: appStoreUr ?? this.appStoreUr,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageLogoAssetPath': imageLogoAssetPath,
      'featuredImageAssetPath': featuredImageAssetPath,
      'imageAssetPaths': imageAssetPaths,
      'website': website?.toString(),
      'playStoreUrl': playStoreUrl?.toString(),
      'appStoreUr': appStoreUr?.toString(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'PortfolioProject(title: $title, description: $description, imageLogoAssetPath: $imageLogoAssetPath, featuredImageAssetPath: $featuredImageAssetPath, imageAssetPaths: $imageAssetPaths, website: $website, playStoreUrl: $playStoreUrl, appStoreUr: $appStoreUr)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PortfolioProject &&
        other.title == title &&
        other.description == description &&
        other.imageLogoAssetPath == imageLogoAssetPath &&
        other.featuredImageAssetPath == featuredImageAssetPath &&
        listEquals(other.imageAssetPaths, imageAssetPaths) &&
        other.website == website &&
        other.playStoreUrl == playStoreUrl &&
        other.appStoreUr == appStoreUr;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        imageLogoAssetPath.hashCode ^
        featuredImageAssetPath.hashCode ^
        imageAssetPaths.hashCode ^
        website.hashCode ^
        playStoreUrl.hashCode ^
        appStoreUr.hashCode;
  }
}
