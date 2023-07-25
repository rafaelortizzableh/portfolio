import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class ProjectDetailsFullScreenDialog extends StatefulWidget {
  const ProjectDetailsFullScreenDialog({
    super.key,
    required this.portfolioProject,
  });
  final PortfolioProject portfolioProject;

  @override
  State<ProjectDetailsFullScreenDialog> createState() =>
      _ProjectDetailsFullScreenDialogState();
}

class _ProjectDetailsFullScreenDialogState
    extends State<ProjectDetailsFullScreenDialog> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode()..requestFocus();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      focusNode: focusNode,
      onFocusChange: (_) => focusNode.requestFocus(),
      actions: ShortcutActions.closePopup,
      shortcuts: ShortcutIntents.closePopupOnEnterOrEscape(context),
      child: Material(
        type: MaterialType.transparency,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: GestureDetector(
            // Adding a GestureDetector to dismiss
            // the dialog when tapping outside of it.
            //
            // Note: This is done so we can prevent the default barrier
            // behavior of the [showDialog] function.
            behavior: HitTestBehavior.opaque,
            onTap: Navigator.of(context).pop,
            child: GestureDetector(
              // Adding another GestureDetector to prevent
              // the dialog from being dismissed
              // when tapping inside of it.
              onTap: () {},
              child: Padding(
                padding: AppConstants.padding32,
                child: ProjectDetailsPage(
                  portfolioProject: widget.portfolioProject,
                  isShownInFullScreenDialog: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
