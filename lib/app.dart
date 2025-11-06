import 'package:flutter/material.dart';

import 'core/core.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      child: PointerInterfaceDetectorWrapper(
        child: ThemeWrapper(
          builder: (themeMode, onChanged, context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              color: Palette.black,
              onGenerateTitle: (context) => context.l10n.appTitle,
              theme: themeMode == ThemeMode.dark
                  ? CustomTheme.darkTheme()
                  : CustomTheme.lightTheme(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              onGenerateRoute: AppRouter.generateDeviceWrapperPageRoute,
            );
          },
        ),
      ),
    );
  }
}
