import 'package:flutter/material.dart';
import 'package:theaccounts/main.dart';
import 'package:theaccounts/model/AppLandingResponse.dart';
import 'package:theaccounts/utils/shared_pref.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScopeModelWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(model: AppModel(), child: MyApp());
  }
}

class AppModel extends Model {
  // Set All default values here
  AppLandingData _appLandingData = AppLandingData(
    primaryThemeColor: '#10CB3C',
    bottomBarActiveColor: '#10CB3C',
    bottomBarInactiveColor: '#808080',
    bottomBarBackgroundColor: '#f7f6f6',
    topBarTextColor: '#ffffff',
    topBarBackgroundColor: '#ffffff',
    totalShoppingCartProducts: 0,
    totalWishListProducts: 0,
    // rtl: true,
    rtl: false,
  );
  bool _darkTheme = false;
  SessionData sessionData = SessionData();

  AppLandingData get appLandingData => _appLandingData;
  bool get isDarkTheme => _darkTheme;

  void updateAppLandingData(AppLandingData newData) {
    _appLandingData = newData;
    SessionData().isDarkTheme().then((isEnabled) {
      _darkTheme = isEnabled;

      notifyListeners();
    });
  }

  void seThemeMode(bool isDarkEnable) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    const _keyDarkTheme = '_keyDarkTheme';

    debugPrint('DarkTheme Enabled -- $isDarkTheme');
    _darkTheme = isDarkEnable;
    prefs.setBool(_keyDarkTheme, _darkTheme);
    notifyListeners();
  }
}
