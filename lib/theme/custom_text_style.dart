import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
    fontSize: 16.fSize,
  );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.whiteA700,
    fontSize: 15.fSize,
  );
  static get titleMediumOnPrimary18 => theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.onPrimary,
    fontSize: 18.fSize,
  );
  static get titleMediumOnPrimaryMedium18 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumIndigoA200 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.indigoA200,
    fontSize: 18.fSize,
    fontWeight: FontWeight.w700,
  );
  static get bodyLargeGray300 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray300,
        fontSize: 18.fSize,
      );
  static get bodyLargeGray50001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
        fontSize: 18.fSize,
      );
  static get bodyLargeGray50001_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
      );
  static get bodyLargePretendardRedA400 =>
      theme.textTheme.bodyLarge!.pretendard.copyWith(
        color: appTheme.redA400,
      );
  static get bodyLargePretendardRedA700 =>
      theme.textTheme.bodyLarge!.pretendard.copyWith(
        color: appTheme.redA700,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
      );
  static get bodyLargePrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodyLargePrimaryContainer18 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 18.fSize,
      );
  static get bodyLargeRedA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.redA700,
    fontFamily: 'Roboto',
      );
  static get bodyLargeBlueA700 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.black900,
    fontFamily: 'Roboto',
  );
  static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumWithe900 => theme.textTheme.bodyMedium!.copyWith(
    color: Colors.white,
  );
  static get bodyMediumBlack1000 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.black900,
    fontSize: 16.fSize,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w800,
  );
  static get bodyMediumGray300 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray300,
        fontSize: 15.fSize,
      );
  static get bodyMediumGray50001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray50001,
      );
  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
        fontSize: 13.fSize,
      );
  static get bodyMediumGray70015 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
        fontSize: 15.fSize,
      );
  static get bodyMediumGray700_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyMediumRedA400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.redA400,
      );
  static get bodySmallGray700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray700,
      );
  // Headline text style
  static get headlineMediumBlack900 => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black900,
      );
  static get headlineMediumGray5002 => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.gray5002,
        fontSize: 26.fSize,
        fontWeight: FontWeight.w500,
      );
  static get headlineMediumWhiteA700 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 26.fSize,
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );
  // Label text style
  static get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeGray50001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeGray5000113 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray50001,
        fontSize: 13.fSize,
      );
  static get labelLargeGray900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeGreenA70001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.greenA70001,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOnError => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onError,
      );
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeRedA400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.redA400,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeBlueText => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.indigoText,
    fontWeight: FontWeight.w600,
    fontSize: 11
  );
  static get labelLargeGrayText => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray700,
    fontWeight: FontWeight.w600,
  );

  static get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelLargeSemiBold13 => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,

      );
  static get titleLargeBlack600 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.black900,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
  );
  static get titleLargeBlack1200 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.black900,
    fontSize: 32
  );
  static get titleLargeGrey1200 => theme.textTheme.titleLarge!.copyWith(
      color: appTheme.gray400,
      fontSize: 32
  );
  static get titleLargeBlack900Medium => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeBlack900Regular => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.w700,
  );
  static get titleLargeBoldIndigo => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
    color: appTheme.indigoText,
      );
  static get titleLargeBold_1 => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleLargeGray700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray700,
        fontWeight: FontWeight.w500,
      );
  static get titleLargePretendard => theme.textTheme.titleLarge!.pretendard;
  static get titleLargePretendardMedium =>
      theme.textTheme.titleLarge!.pretendard.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleLargeRedA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.redA700,
        fontSize: 22.fSize,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleLargeWhiteA70022 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
      );
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMedium18_1 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBlack600 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.black900,
    fontSize: 16.fSize,
    fontWeight: FontWeight.w700,
  );
  static get titleMediumBlack500 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.black900,
    fontSize: 15.fSize,
    fontWeight: FontWeight.w700,
  );
  static get titleMediumBlack900Medium => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBlack900Medium18 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBlack900_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get dropdownBlack => theme.textTheme.titleMedium!.copyWith(
    color: Colors.black,
  );
  static get titleMediumwhite500 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.whiteA700,
    fontSize: 11
  );
  static get titleMediumwhite700 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.whiteA700,
  );
  static get titleMediumBluegray400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray400,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumGray500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumGray50001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50001,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray50001Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray50001_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50001,
      );
  static get titleMediumGray50002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50002,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray5002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray5002,
        fontSize: 18.fSize,
      );
  static get titleMediumGray500_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get titleMediumGray700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray700,
      );
  static get titleMediumGray700Medium => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray700,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray700_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray700,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPretendard =>
      theme.textTheme.titleMedium!.pretendard.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPretendardBlack900 =>
      theme.textTheme.titleMedium!.pretendard.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPretendardBlack900Medium =>
      theme.textTheme.titleMedium!.pretendard.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimary18 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
      );
  static get titleMediumPrimaryBold => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumRedA400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA400,
      );
  static get titleMediumRedA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA700,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumWhiteA700_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallRoboto => theme.textTheme.titleSmall!.roboto.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoGray50001 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoBlack50001 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoGray50001SemiBold =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRobotoMedium =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoPrimary =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRobotoPrimaryContainer =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRobotoPrimaryContainerMedium =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoPrimaryContainerMedium_1 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoPrimaryContainerSemiBold =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRobotoPrimarySemiBold =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRobotoRedA400 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.redA400,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRobotoSemiBold =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRobotoWhiteA700 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRobotoWhiteA700Medium =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get pretendard {
    return copyWith(
      fontFamily: 'Pretendard',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
