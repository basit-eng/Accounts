import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:theaccounts/ScopedModelWrapper.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/alerts.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/closingPayment.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/dashboard.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/hidecapital.screen.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/rollover.screen.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/showcapital.screen.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/withdrawbotttomsheet.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/forget_pass.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/myhomepage.dart';
import 'package:theaccounts/screens/setting/profile_screen.dart';
import 'package:theaccounts/screens/setting/setting.dart';
import 'package:theaccounts/screens/setting/update_profile.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/verification_method.dart';
import 'package:theaccounts/utils/styles.dart';

void main() {
  runApp(ScopeModelWrapper());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, _, model) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'the accounts',
            theme: Styles.lightTheme(),
            darkTheme: Styles.darkTheme(),
            themeMode: model.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            routes: {
              '/': (context) => MyHomePage(),
              ShowCapitalScreen.routeName: (context) => ShowCapitalScreen(),
              HideCapitalScreen.routeName: (context) => HideCapitalScreen(),
              WithDrawPaymentAlert.routeName: (context) =>
                  WithDrawPaymentAlert(),
              ClosingPaymentScreen.routeName: (context) =>
                  ClosingPaymentScreen(),
              DashBoardScreen.routeName: (context) => DashBoardScreen(),
              RollOverScreen.routeName: (context) => RollOverScreen(),
              WithDrawHoverLayerScreen.routeName: (context) =>
                  WithDrawHoverLayerScreen(),
              MyHomePage.routeName: (context) => MyHomePage(),
              ForgetPsswordScreen.routeName: (context) => ForgetPsswordScreen(),
              ProfileScreen.routeName: (context) => ProfileScreen(),
              SettingScreen.routeName: (context) => SettingScreen(),
              UpdateProfile.routeName: (context) => UpdateProfile(),
              VerificationScreen.routeName: (context) => VerificationScreen(),
            });
      },
    );
  }
}
