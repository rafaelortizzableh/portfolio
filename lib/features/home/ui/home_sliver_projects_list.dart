import 'package:flutter/material.dart';

import '../../features.dart';

class HomeSliverProjectsList extends StatelessWidget {
  const HomeSliverProjectsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final projects = PortfolioProjects.projects.toList();
    return SliverList.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];

        return ProjectItemTile(
          portfolioProject: project,
          key: ObjectKey('project-item-tile-$project-$index'),
        );
      },
    );
  }
}
