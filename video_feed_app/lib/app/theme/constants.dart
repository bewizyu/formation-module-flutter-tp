import 'package:flutter/material.dart';

// --------------------------------- //
// ------------ COLORS ------------- //
// --------------------------------- //

// Primary
const Color kColorPrimaryGrey = Color(0xffF3F6F8);
const Color kColorBluePrimary = Color(0xff42a5f5);
const Color kColorBlueSecondary = Color(0xff0077c2);

// Secondary
const Color kColorDarkBlue = Color(0xff353853);
const Color kColorWhite = Color(0xffFFFFFF);
const Color kColorSecondaryGrey = Color(0xff4F4F4F);
const Color kColorLightGrey = Color(0xffE5E5E5);


// --------------------------------- //
// ------------ THEMES ------------- //
// --------------------------------- //

ThemeData generateVideoFeedsTheme(BuildContext context) {
  final theme = Theme.of(context);
  return ThemeData(
    primaryColor: kColorBluePrimary,
    selectedRowColor: kColorBlueSecondary,
    accentColor: kColorDarkBlue,
    fontFamily: 'YanoneKaffeesatz',
    backgroundColor: kColorPrimaryGrey,
    canvasColor: kColorWhite,
    disabledColor: kColorSecondaryGrey,
    appBarTheme: theme.appBarTheme.copyWith(
      color: kColorBluePrimary,
    ),
    textTheme: theme.textTheme.copyWith(
      headline: TextStyle(
        color: kColorWhite,
        fontFamily: 'FjallaOne',
        fontSize: 36.0,
      ),
      subhead: TextStyle(
        color: kColorBluePrimary,
        fontFamily: 'FjallaOne',
        fontSize: 36.0,
      ),
      title: TextStyle(
        color: kColorBluePrimary,
        fontSize: 28.0,
        fontWeight: FontWeight.normal,
      ),
      subtitle: TextStyle(
        color: kColorBluePrimary,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: 22.0,
      ),
      display1: TextStyle(
        color: kColorDarkBlue,
        fontStyle: FontStyle.normal,
        fontSize: 18.0,
      ),
      display2: TextStyle(
        color: kColorWhite,
        fontStyle: FontStyle.normal,
        fontSize: 16.0,
      ),
    ),
  );
}

// --------------------------------- //
// ------------ DECORATIONS -------- //
// --------------------------------- //

const LinearGradient kBackgroundGradient = LinearGradient(
// Where the linear gradient begins and ends
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
// Add one stop for each color. Stops should increase from 0 to 1
  colors: [
    kColorBlueSecondary,
    kColorBluePrimary,
  ],
);

const LinearGradient kAppBarGradient = LinearGradient(
// Where the linear gradient begins and ends
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
// Add one stop for each color. Stops should increase from 0 to 1
  colors: [
    Color(0xff00dfff),
    Color(0xff8024ff),
  ],
);
