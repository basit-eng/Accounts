import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:theaccounts/ScopedModelWrapper.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/dashboard.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/main_setting.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/myhomepage.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';
import 'package:theaccounts/screens/setting/screens/profile_screen.dart';
import 'package:theaccounts/screens/setting/screens/update_profile.dart';
import 'package:theaccounts/utils/shared_pref.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const routeName = '/setting-screen';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     ChangeTheme(),
        //   ],
        // ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            TopWidgets(),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 300,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 6,
                      offset: Offset(3, 6))
                ],
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 231, 121, 36),
                    Color.fromARGB(255, 205, 28, 102),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/user.png',
                      color: Theme.of(context).backgroundColor),
                  ListTile(
                    title: Center(
                      child: Text(
                        'Miz  Roj',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    subtitle: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '100639',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ),
                            );
                          },
                          child: SmallRadiusButton(
                            text: "View Profile",
                            color: [Color(0xFFFAFAFA), Color(0xFFFAFAFA)],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainSettings(),
                              ),
                            );
                          },
                          child: SmallRadiusButton(
                            text: 'Setting',
                            color: [Color(0xFFFAFAFA), Color(0xFFFAFAFA)],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                  child: Cards(
                    title: 'Update Profile',
                    iconPath: "assets/images/user.png",
                  ),
                ),
                GestureDetector(
                  //update bank detail-->
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProfile(),
                      ),
                    );
                  },
                  child: Cards(
                    title: 'Update Bank Details',
                    iconPath: "assets/images/user.png",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 160,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 3,
                    spreadRadius: 4,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashBoardScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 08),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(08)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/dashboard.png',
                            height: 30,
                            width: 30,
                          ),
                          Text(
                            'Dashboard',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashBoardScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 08),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(08)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/messages.png',
                            height: 30,
                            width: 30,
                          ),
                          Text(
                            'Messaging',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding TopWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (Context) => MyHomePage(),
                ),
              );
            },
            child: SmallRadiusButton(
              text: "Log Out",
              color: [
                Color.fromARGB(255, 50, 167, 230),
                Color.fromARGB(255, 194, 44, 231),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  Cards({Key? key, required this.title, required this.iconPath})
      : super(key: key);
  final String title;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 3,
            spreadRadius: 3,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            height: 40,
            width: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 06.0),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
