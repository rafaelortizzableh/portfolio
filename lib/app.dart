import 'package:flutter/material.dart';

import 'core/core.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      child: PointerInterfaceDetectorWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          color: Palette.black,
          onGenerateTitle: (context) => context.l10n.appName,
          theme: CustomTheme.lightTheme(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: AppRouter.generateDeviceWrapperPageRoute,
        ),
      ),
    );
  }
}
