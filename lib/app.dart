import 'package:flutter/material.dart';

import 'core/core.dart';
import 'features/features.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = PortfolioProjects.projects.toList();
    return MaterialApp(
      onGenerateTitle: (context) => context.l10n.appName,
      theme: CustomTheme.lightTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: PointerInterfaceDetectorWrapper(
        child: Builder(
          builder: (context) {
            return StatusBarWrapper(
              child: Scaffold(
                bottomNavigationBar: const ContactIconsWrap(),
                body: SafeArea(
                  bottom: true,
                  child: Column(
                    children: [
                      const PortfolioHeader(),
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: AppConstants.mobileLayoutMaxWidth,
                          ),
                          child: ListView.builder(
                            itemCount: projects.length,
                            itemBuilder: (context, index) {
                              final project = projects[index];
                              return PorfolioItemTile(
                                portfolioProject: project,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DraggableScrollableSheet'),
//       ),
//       body: DraggablePortfolioItemSheet(
//         portfolioProject: PortfolioProjects.projects.first,
//       ),
//     );
//   }
// }

// class DraggablePortfolioItemSheet extends StatefulWidget {
//   const DraggablePortfolioItemSheet({
//     super.key,
//     required this.portfolioProject,
//   });
//   final PortfolioProject portfolioProject;

//   @override
//   State<DraggablePortfolioItemSheet> createState() =>
//       _DraggablePortfolioItemSheetState();
// }

// class _DraggablePortfolioItemSheetState
//     extends State<DraggablePortfolioItemSheet> {
//   late final PageController _pageController = PageController();

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.expand(
//       child: Stack(
//         children: [
//           const SizedBox.expand(
//             child: ColoredBox(color: Colors.black),
//           ),
//           SizedBox.expand(
//             child: GestureDetector(
//               // onTap: () => _toggleTitleShown(!_isTitleShown),
//               child: SizedBox(
//                 child: PageView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: widget.portfolioProject.imageAssetPaths.length,
//                   controller: _pageController,
//                   itemBuilder: (context, index) {
//                     final imageAsset =
//                         widget.portfolioProject.imageAssetPaths[index];
//                     // final heroTag = _createHeroTag(
//                     //   imageAsset: imageAsset,
//                     //   index: _currentImageIndex,
//                     // );

//                     return PorfolioImage(
//                       heroTag: 'heroTag',
//                       imageAsset: imageAsset,
//                       imageAssetPaths: widget.portfolioProject.imageAssetPaths,
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 0.0,
//             right: 0.0,
//             child: IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.fullscreen),
//             ),
//           ),
//           DraggableScrollableSheet(
//             initialChildSize: 0.4,
//             minChildSize: 0.2,
//             builder: (BuildContext context, ScrollController scrollController) {
//               return DecoratedBox(
//                 decoration: const BoxDecoration(
//                   color: Colors.transparent,
//                 ),
//                 child: ListView(
//                   controller: scrollController,
//                   children: [
//                     Container(
//                       height: 200.0,
//                       color: Colors.blue[100],
//                     ),
//                     const SizedBox(
//                       height: 100.0,
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.close),
//           ),
//         ],
//       ),
//     );
//   }
// }
