import 'package:flutter/material.dart';

class Styles {
// hexSting format #FFFFFF
  static Color parseColor(String hexString) {
    try {
      return Color(int.parse(hexString.replaceFirst('#', '0x')) + 0xFF000000);
    } catch (e) {
      return Colors.orange;
    }
  }

// hexSting format #FFFFFF
  static int parseColorInt(String hexString) {
    try {
      return int.parse(hexString.replaceFirst('#', '0x')) + 0xFF000000;
    } catch (e) {
      return 0xFF121212;
    }
  }

  static Map<int, Color> getColorSwatch(Color color) {
    return {
      50: Color.fromRGBO(color.red, color.green, color.blue, .1),
      100: Color.fromRGBO(color.red, color.green, color.blue, .2),
      200: Color.fromRGBO(color.red, color.green, color.blue, .3),
      300: Color.fromRGBO(color.red, color.green, color.blue, .4),
      400: Color.fromRGBO(color.red, color.green, color.blue, .5),
      500: Color.fromRGBO(color.red, color.green, color.blue, .6),
      600: Color.fromRGBO(color.red, color.green, color.blue, .7),
      700: Color.fromRGBO(color.red, color.green, color.blue, .8),
      800: Color.fromRGBO(color.red, color.green, color.blue, .9),
      900: Color.fromRGBO(color.red, color.green, color.blue, 1),
    };
  }

  static bool isDarkThemeEnabled(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  EdgeInsets defaultPadding() => EdgeInsets.fromLTRB(12, 8, 12, 0);

  void removeFocusFromInputField(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      // primarySwatch: MaterialColor(
      //   // parseColorInt(model.appLandingData.primaryThemeColor),
      //   // getColorSwatch(parseColor(model.appLandingData.primaryThemeColor)),
      // ),
      // primaryColor: getColorSwatch(
      //   Colors.black54.withOpacity(0.7),

      //   // parseColor(model.appLandingData.primaryThemeColor)
      // )[900],
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Color(0xFF2A2D2E),

      fontFamily: 'Monstserrat',
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.8),
        ),

        // parseColor(model.appLandingData.topBarTextColor)),
        titleTextStyle: TextStyle(
          fontFamily: 'Monstserrat',
          fontSize: 20,
          color: Colors.white.withOpacity(0.8),

          // color: parseColor(model.appLandingData.topBarTextColor),
        ),
      ),
      textTheme: ThemeData.dark().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'Monstserrat',
              fontSize: 22,
            ),
            subtitle1: TextStyle(
                fontFamily: 'Monstserrat',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
            subtitle2: TextStyle(
                fontFamily: 'Monstserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600),
            bodyText1: TextStyle(
                fontFamily: 'Monstserrat',
                fontSize: 14,
                fontWeight: FontWeight.w500),
            bodyText2: TextStyle(
                fontFamily: 'Monstserrat',
                fontSize: 12,
                fontWeight: FontWeight.w400),
            button: TextStyle(
              fontFamily: 'Monstserrat',
              fontSize: 15,
            ),
            labelMedium: TextStyle(
                fontFamily: 'Monstserrat',
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),

      backgroundColor: Color(0xFF2A2D2E),
      cardColor: Color(0xFF0E0F0F).withOpacity(0.6),
      shadowColor: Colors.black.withOpacity(0.2),
      iconTheme: IconThemeData(color: Colors.white, size: 24, opacity: 0.4),
      primaryIconTheme: ThemeData.dark().primaryIconTheme.copyWith(
            color: Color(0xFF2A2D2E),

            // parseColor(model.appLandingData.topBarTextColor),
          ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF2A2D2E),
        // parseColor(model.appLandingData.bottomBarBackgroundColor),
        elevation: 10,
        selectedItemColor: Color(0xFF2A2D2E),

        // parseColor(
        //     model.appLandingData.bottomBarActiveColor), // Need to set from api
        unselectedItemColor: Colors.white.withOpacity(0.8),

        // parseColor(model
        //     .appLandingData.bottomBarInactiveColor), // Need to set from api
        showUnselectedLabels: true,
      ),
      toggleableActiveColor: Colors.green.withOpacity(0.9),

      // getColorSwatch(parseColor(model.appLandingData.primaryThemeColor))[
      //     900], // checked checkbox color
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      // primarySwatch: MaterialColor(
      //   // parseColorInt(model.appLandingData.primaryThemeColor),
      //   // getColorSwatch(parseColor(model.appLandingData.primaryThemeColor)),
      // ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Color(0xFFF1F1F2),
      fontFamily: 'Montserrat',

      appBarTheme: AppBarTheme(
        // iconTheme: IconThemeData(color: Color(0xFFF1F1F2)),
        // parseColor(model.appLandingData.topBarTextColor)),
        titleTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20,
          color: Colors.black54.withOpacity(0.6),

          // color: parseColor(model.appLandingData.topBarTextColor),
        ),
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'Monstserrat',
              color: Colors.grey[600],
              fontSize: 22,
            ),
            subtitle1: TextStyle(
                fontFamily: 'Monstserrat',
                color: Colors.grey[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
            subtitle2: TextStyle(
                fontFamily: 'Monstserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600),
            bodyText1: TextStyle(
                fontFamily: 'Monstserrat',
                fontSize: 14,
                fontWeight: FontWeight.w500),
            bodyText2: TextStyle(
                fontFamily: 'Monstserrat',
                fontSize: 12,
                fontWeight: FontWeight.w400),
            button: TextStyle(
              fontFamily: 'Monstserrat',
              fontSize: 15,
            ),
            labelMedium: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),

      backgroundColor: Color(0xFFF1F1F2),
      // backgroundColor: Color(0xFFCC0B00),

      cardColor: Color(0xFFFFFFFF),
      shadowColor: Colors.grey.withOpacity(0.3),
      iconTheme: IconThemeData(color: Colors.black, size: 24, opacity: 0.7),
      primaryIconTheme: ThemeData.light().primaryIconTheme.copyWith(
            // AppBar icon color
            // color: parseColor(model.appLandingData.topBarTextColor),
            color: Color(0xF1F1F2),
          ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFF1F1F2),
        // parseColor(model.appLandingData.bottomBarBackgroundColor),
        elevation: 10,
        selectedItemColor: Colors.blue.withOpacity(0.8),

        // parseColor(
        //     model.appLandingData.bottomBarActiveColor), // Need to set from api
        unselectedItemColor: Colors.grey.withOpacity(0.8),

        // parseColor(model
        // .appLandingData.bottomBarInactiveColor), // Need to set from api
        showUnselectedLabels: true,
      ),
    );
  }

  TextStyle? bodyText14(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).primaryColor,
        );
  }

  TextStyle? bodyText16(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).primaryColor,
        );
  }

  TextStyle? bodyText12(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).primaryColor,
        );
  }

  TextStyle? bodyText22(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        );
  }

  static Color secondaryButtonColor = Color(0x2B2E43 + 0xFF000000);

  static TextStyle productNameTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
        );
  }

  static TextStyle productPriceTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        );
  }

  static Color? textColor(BuildContext context) {
    return isDarkThemeEnabled(context) ? Colors.grey[200] : Colors.grey[800];
  }
}
