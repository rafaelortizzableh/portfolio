import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class HomeSliverProjectsList extends StatelessWidget {
  const HomeSliverProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final projects = PortfolioProjects.projects(l10n).toList();

    return SliverPadding(
      padding: const EdgeInsets.only(bottom: AppConstants.spacing16),
      sliver: SliverList.separated(
        itemCount: projects.length,
        separatorBuilder: (context, index) => AppConstants.verticalSpacing12,
        itemBuilder: (context, index) {
          final project = projects[index];

          return ProjectItemTile(
            portfolioProject: project,
            key: ValueKey('project-item-tile-$project-$index'),
          );
        },
      ),
    );
  }
}
