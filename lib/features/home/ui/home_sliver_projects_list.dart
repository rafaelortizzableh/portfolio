import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class HomeSliverProjectsList extends StatelessWidget {
  const HomeSliverProjectsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final projects = PortfolioProjects.projects.toList();
    return SliverList.separated(
      itemCount: projects.length,
      separatorBuilder: (context, index) => AppConstants.verticalSpacing12,
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
