import 'package:example/styles/icon_button_style_database.dart';
import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';

import 'my_text_style_database.dart';

class MyStyleData {
  static final StyleData textFormFieldStyles = StyleData({})
    ..inject(TaavTextFormFieldStyleData.toStyle(
      themeName: 'textFieldFilled',
      cursorColor: TaavColors.black,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      contentTextStyle: (StyleData style) {
        return TextStyle(
            fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
            color: style.get<Color>('textBase-contentColor'));
      },
      labelTextStyle: (StyleData style) {
        return TextStyle(
          fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
          fontWeight: FontWeight.bold,
        );
      },
      hintTextStyle: (StyleData style) {
        return TextStyle(
            fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
            color: style.get<Color>('textBase-contentColor').withAlpha(160));
      },
      helperTextStyle: const TextStyle(fontSize: 12, color: TaavColors.black54),
      errorTextStyle: const TextStyle(
          fontSize: 12, color: Color(0xFFBC0000), fontWeight: FontWeight.w500),
      counterTextStyle:
          const TextStyle(fontSize: 12, color: TaavColors.black54),
      prefixTextStyle: (StyleData style) {
        return TextStyle(
            fontSize: style.get<double>('buttonBase-mediumFontSize') ?? 16,
            fontWeight: FontWeight.bold,
            color: TaavColors.black);
      },
      suffixTextStyle: 'textFieldFilled-prefixTextStyle',
      fillColor: TaavColors.white,
      iconColor: TaavColors.black54,
      enabledBorder: BorderSide.none,
      focusedBorder: BorderSide.none,
      errorBorder: BorderSide.none,
      focusedErrorBorder: BorderSide.none,
      disabledBorder: BorderSide.none,
      isFilled: true,
      isOutlined: false,
    ))
    ..inject(TaavTextFormFieldStyleData.toStyle(
      themeName: 'textFieldFlat',
      cursorColor: TaavColors.black,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      contentTextStyle: const TextStyle(fontSize: 16),
      labelTextStyle: const TextStyle(
          fontSize: 15, color: TaavColors.black, fontWeight: FontWeight.w400),
      hintTextStyle: const TextStyle(fontSize: 16, color: TaavColors.black87),
      helperTextStyle: const TextStyle(fontSize: 13, color: TaavColors.black87),
      errorTextStyle: TextStyle(
          fontSize: 13,
          color: TaavColors.red[600],
          fontWeight: FontWeight.bold),
      counterTextStyle:
          const TextStyle(fontSize: 13, color: TaavColors.black87),
      prefixTextStyle: TextStyle(fontSize: 16, color: TaavColors.blue[700]),
      suffixTextStyle: 'textFieldFlat-prefixTextStyle',
      fillColor: TaavColors.white,
      iconColor: TaavColors.black.withOpacity(0.5),
      enabledBorder: const BorderSide(
        color: TaavColors.black54,
        width: 1.0,
      ),
      focusedBorder: const BorderSide(
        color: TaavColors.black,
        width: 2.0,
      ),
      errorBorder: BorderSide(
        color: TaavColors.red[600],
        width: 1.0,
      ),
      focusedErrorBorder: BorderSide(
        color: TaavColors.red[500],
        width: 2.0,
      ),
      disabledBorder: const BorderSide(
        color: TaavColors.grey,
        width: 1.0,
      ),
      isFilled: true,
      isOutlined: false,
    ));

  static final StyleData radioStyles = StyleData({})
    ..inject(TaavRadioStyleData.toStyle(
        themeName: 'radioTheme',
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        labelTextStyle: (StyleData style) {
          return TextStyle(
              fontSize: style.get<double>('textBody2-fontSize'),
              fontWeight: style.get<FontWeight>('textBody2-fontWeight'),
              color: style.get<Color>('textBody2-textColor'));
        },
        radioColor: 'themeBase-primaryColor',
        backgroundColor: TaavColors.transparent,
        disabledColor: 'themeBase-disabledColor',
        splashColor: TaavThemes.primaryColor.withOpacity(0.4),
        contentSpacing: 0.0,
        containerShape: TaavWidgetShape.rectangle))
    ..inject(TaavRadioStyleData.toStyle(
        themeName: 'radioThemeTest',
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        labelTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: TaavColors.white),
        radioColor: TaavColors.black,
        backgroundColor: Colors.blueGrey,
        disabledColor: 'themeBase-disabledColor',
        splashColor: Colors.grey,
        containerShape: TaavWidgetShape.semiRound));

  static final StyleData iconButtonStyle = StyleData({})
    ..inject(TaavIconButtonStyleDataBase.toStyle(
      themeName: 'iconButtonBase',
      tinySize: 14.0,
      smallSize: 18.0,
      mediumSize: 22.0,
      largeSize: 26.0,
      giantSize: 30.0,
      tinyPadding: const EdgeInsets.all(6.0),
      smallPadding: const EdgeInsets.all(8.0),
      mediumPadding: const EdgeInsets.all(10.0),
      largePadding: const EdgeInsets.all(12.0),
      giantPadding: const EdgeInsets.all(14.0),
    ))
    ..inject(TaavIconButtonStyleData.toStyle(
      themeName: 'iconButtonFilled',
      backgroundColor: const TaavStateColor(
        normalColor: 'themeBase-primaryColor',
        pressedColor: 'themeBase-primaryColor',
        disabledColor: 'themeBase-disabledColor',
      ),
      borderColor: const TaavStateColor(
          normalColor: 'themeBase-primaryColor',
          pressedColor: 'themeBase-primaryColor',
          disabledColor: 'themeBase-disabledColor'),
      borderWidth: 0.0,
      iconColor: const TaavStateColor(
        normalColor: 'buttonBase-textColor',
        pressedColor: 'buttonBase-textColor',
        disabledColor: TaavColors.black45,
      ),
      shadowColor: TaavColors.grey,
      splashColor: null,
      elevation: 2.0,
    ))
    ..inject(_getFilledForStatus('Primary'))
    ..inject(_getFilledForStatus('Secondary'))
    ..inject(_getFilledForStatus('Success'))
    ..inject(_getFilledForStatus('Warning'))
    ..inject(_getFilledForStatus('Danger'))
    ..inject(_getFilledForStatus('Info'))
    ..inject(TaavIconButtonStyleData.toStyle(
      themeName: 'iconButtonOutline',
      backgroundColor: const TaavStateColor(
        normalColor: TaavColors.transparent,
        pressedColor: TaavColors.transparent,
        disabledColor: 'themeBase-disabledColor',
      ),
      borderColor: const TaavStateColor(
        normalColor: 'themeBase-primaryColor',
        pressedColor: 'themeBase-primaryColor',
        disabledColor: 'themeBase-disabledColor',
      ),
      borderWidth: 1.1,
      iconColor: const TaavStateColor(
        normalColor: 'themeBase-primaryColor',
        pressedColor: 'themeBase-primaryColor',
        disabledColor: TaavColors.black45,
      ),
      shadowColor: TaavColors.transparent,
      splashColor: TaavThemes.primaryColor.withAlpha(33),
      elevation: 0.0,
    ))
    ..inject(_getOutlineForStatus('Primary'))
    ..inject(_getOutlineForStatus('Secondary'))
    ..inject(_getOutlineForStatus('Success'))
    ..inject(_getOutlineForStatus('Warning'))
    ..inject(_getOutlineForStatus('Danger'))
    ..inject(_getOutlineForStatus('Info'))
    ..inject(TaavIconButtonStyleData.toStyle(
      themeName: 'iconButtonFlat',
      backgroundColor: const TaavStateColor(
        normalColor: TaavColors.transparent,
        pressedColor: TaavColors.transparent,
        disabledColor: TaavColors.transparent,
      ),
      borderColor: const TaavStateColor(
          normalColor: TaavColors.transparent,
          pressedColor: TaavColors.transparent,
          disabledColor: TaavColors.transparent),
      borderWidth: 0.0,
      iconColor: const TaavStateColor(
        normalColor: 'themeBase-primaryColor',
        pressedColor: 'themeBase-primaryColor',
        disabledColor: 'textBase-disabledColor',
      ),
      shadowColor: TaavColors.transparent,
      splashColor: TaavThemes.primaryColor.withAlpha(33),
      elevation: 0.0,
    ))
    ..inject(_getFlatForStatus('Primary'))
    ..inject(_getFlatForStatus('Secondary'))
    ..inject(_getFlatForStatus('Success'))
    ..inject(_getFlatForStatus('Warning'))
    ..inject(_getFlatForStatus('Danger'))
    ..inject(_getFlatForStatus('Info'))
    ..inject(TaavIconButtonStyleData.toStyle(
      themeName: 'iconButtonAmin',
      backgroundColor: const TaavStateColor(
        normalColor: TaavColors.white,
        pressedColor: TaavColors.white,
        disabledColor: 'textBase-disabledColor',
      ),
      borderColor: const TaavStateColor(
        normalColor: TaavColors.red,
        pressedColor: TaavColors.blue,
        disabledColor: 'textBase-disabledColor',
      ),
      borderWidth: 0.0,
      iconColor: TaavStateColor(
        normalColor: TaavColors.blue[700],
        pressedColor: TaavColors.purple,
        disabledColor: 'textBase-disabledColor',
      ),
      shadowColor: TaavColors.grey,
      splashColor: TaavColors.grey[200],
      elevation: 4.0,
    ));

  static StyleData _getFilledForStatus(String status) {
    String statusLower = status.toLowerCase();
    return TaavIconButtonStyleData.toStyle(
      themeName: 'iconButtonFilled$status',
      backgroundColor: TaavStateColor(
          normalColor: 'themeBase-${statusLower}Color',
          pressedColor: 'themeBase-${statusLower}Color',
          disabledColor: 'themeBase-disabledColor'),
      borderColor: TaavStateColor(
          normalColor: 'themeBase-${statusLower}Color',
          pressedColor: 'themeBase-${statusLower}Color',
          disabledColor: 'themeBase-disabledColor'),
      borderWidth: 'iconButtonFilled-borderWidth',
      iconColor: 'iconButtonFilled-iconColor',
      shadowColor: 'iconButtonFilled-shadowColor',
      splashColor: null,
      elevation: 4.0,
    );
  }

  static StyleData _getOutlineForStatus(String status) {
    String statusLower = status.toLowerCase();
    return TaavIconButtonStyleData.toStyle(
      themeName: 'iconButtonOutline$status',
      backgroundColor: 'iconButtonOutline-backgroundColor',
      borderColor: TaavStateColor(
          normalColor: 'themeBase-${statusLower}Color',
          pressedColor: 'themeBase-${statusLower}Color',
          disabledColor: 'themeBase-disabledColor'),
      borderWidth: 'iconButtonOutline-borderWidth',
      iconColor: TaavStateColor(
          normalColor: 'themeBase-${statusLower}Color',
          pressedColor: 'themeBase-${statusLower}Color',
          disabledColor: TaavColors.black45),
      shadowColor: 'iconButtonOutline-shadowColor',
      splashColor: (StyleData style) =>
          style.get<Color>('textBase-${statusLower}Color').withAlpha(33),
      elevation: 0.0,
    );
  }

  static StyleData _getFlatForStatus(String status) {
    String statusLower = status.toLowerCase();
    return TaavIconButtonStyleData.toStyle(
      themeName: 'iconButtonFlat$status',
      backgroundColor: 'iconButtonFlat-backgroundColor',
      borderColor: 'iconButtonFlat-borderColor',
      borderWidth: 'iconButtonFlat-borderWidth',
      iconColor: TaavStateColor(
          normalColor: 'themeBase-${statusLower}Color',
          pressedColor: 'themeBase-${statusLower}Color',
          disabledColor: 'themeBase-disabledColor'),
      shadowColor: 'iconButtonFlat-shadowColor',
      splashColor: (StyleData style) =>
          style.get<Color>('textBase-${statusLower}Color').withAlpha(33),
      elevation: 0.0,
    );
  }

  static final StyleData textStyles = StyleData({})
    ..inject(TaavTextStyleDataBase.toStyle(
      themeName: 'textBase',
      primaryColor: 'themeBase-primaryColor',
      secondaryColor: 'themeBase-secondaryColor',
      successColor: 'themeBase-successColor',
      dangerColor: 'themeBase-dangerColor',
      contentColor: const Color(0xFF2C2C2C),
      disabledColor: 'themeBase-disabledColor',
      infoColor: 'themeBase-infoColor',
      warningColor: 'themeBase-warningColor',
    ))
  // Headline 1
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textHeadline1',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 96.0,
        fontWeight: FontWeight.bold,
        textColor: 'textBase-contentColor'))
// Headline 2
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textHeadline2',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 60.0,
        fontWeight: FontWeight.bold,
        textColor: 'textBase-contentColor'))
// Headline 3
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textHeadline3',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        textColor: 'textBase-contentColor'))
// Headline 4
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textHeadline4',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 34.0,
        fontWeight: FontWeight.w500,
        textColor: 'textBase-contentColor'))
// Headline 5
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textHeadline5',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
        textColor: 'textBase-contentColor'))
// Headline 6
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textHeadline6',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        textColor: 'textBase-contentColor'))
// Subtitle 1
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textSubtitle1',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        textColor: 'textBase-contentColor'))
// Subtitle 2
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textSubtitle2',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        textColor: 'textBase-contentColor'))
// Body 1
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textBody1',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        textColor: 'textBase-contentColor'))
// Body 2
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textBody2',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        textColor: 'textBase-contentColor'))
// Button
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textButton',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        textColor: 'textBase-contentColor'))
// Caption 1
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textCaption1',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        textColor: 'textBase-contentColor'))
// Caption 2
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textCaption2',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 12.0,
        fontWeight: FontWeight.w300,
        textColor: 'textBase-contentColor'))
// Overline
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textOverline',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 11.0,
        fontWeight: FontWeight.w900,
        textColor: 'textBase-contentColor'))
// Overline
    ..inject(TaavTextStyleData.toStyle(
        themeName: 'textAmin',
        fontFamily: 'themeBase-fontFamilyPrimary',
        fontSize: 15.0,
        fontWeight: FontWeight.w900,
        textColor: TaavColors.green));

  static final StyleData switchStyles = StyleData({})
    ..inject(TaavSwitchStyleData.toStyle(
        themeName: 'switch',
        activeThumbColor: 'themeBase-primaryColor',
        inactiveThumbColor: 'themeBase-disabledColor',
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        labelTextStyle: 'radioTheme-labelTextStyle',
        backgroundColor: TaavColors.transparent,
        splashColor: TaavThemes.primaryColor.withOpacity(0.4),
        contentSpacing: 0.0,
        containerShape: TaavWidgetShape.rectangle))
    ..inject(TaavSwitchStyleData.toStyle(
      themeName: 'switchTristate',
      activeThumbColor: 'themeBase-primaryColor',
      noneThumbColor: 'themeBase-disabledColor',
      inactiveThumbColor: 'themeBase-secondaryColor',
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      labelTextStyle: 'switch-labelTextStyle',
      backgroundColor: 'switch-backgroundColor',
      splashColor: 'switch-splashColor',
      contentSpacing: 10.0,
      containerShape: 'switch-containerShape',
    ));


}
