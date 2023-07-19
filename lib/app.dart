import 'package:flutter/material.dart';

import 'core/core.dart';
import 'features/features.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PointerInterfaceDetectorWrapper(
      child: MaterialApp(
        color: Palette.black,
        onGenerateTitle: (context) => context.l10n.appName,
        theme: CustomTheme.lightTheme(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorKey: AppRouter.navigatorKey,
        onGenerateRoute: AppRouter.generatePageRoute,
        builder: (context, child) => DeviceWrapper(child: child!),
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
