import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.padding12,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: Palette.grey,
              width: 4.0,
            ),
          ),
          borderRadius: AppConstants.borderRadius12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Rafael '.toUpperCase(),
                    style: AppTextStyles.h1.copyWith(
                      color: Palette.grey,
                    ),
                    children: [
                      TextSpan(
                        text: 'Ortiz '.toUpperCase(),
                        style: AppTextStyles.h1.copyWith(
                          color: Palette.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Zableh'.toUpperCase(),
                        style: AppTextStyles.h1.copyWith(
                          color: Palette.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppConstants.verticalSpacing12,
              Text(
                context.l10n.softwareEngineer.toUpperCase(),
                style: AppTextStyles.mediumRegular.copyWith(
                  color: Palette.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
