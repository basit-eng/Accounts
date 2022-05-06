import 'package:flutter/material.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/dashboard.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/myhomepage.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/profile_screen.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/update_profile.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const routeName = '/setting-screen';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 231, 231, 234),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
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
                  Image.asset(
                    'images/user.png',
                    color: Colors.white,
                  ),
                  ListTile(
                    title: Center(
                      child: Text(
                        'Miz  Roj',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    subtitle: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '100639',
                          style: TextStyle(color: Colors.white, fontSize: 17),
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
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: CardBtns(
                              btnName: 'View Profile',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingScreen(),
                              ),
                            );
                          },
                          child: Expanded(
                            flex: 1,
                            child: CardBtns(
                              btnName: '    Setting    ',
                            ),
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateProfile(),
                          ),
                        );
                      },
                      child: Cards(
                        title: 'Update Profile',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Cards(
                        title: 'Update Bank Details',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 3,
                    spreadRadius: 4,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 231, 234),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 70),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashBoardScreen(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Image.asset(
                              'images/dashboard.png',
                              height: 30,
                              width: 30,
                            ),
                            title: Text(
                              'Dashboard',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 231, 234),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 70),
                        child: ListTile(
                          leading: Image.asset(
                            'images/messages.png',
                            height: 30,
                            width: 30,
                          ),
                          title: Text(
                            'Messaging',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding TopWidgets() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
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
            child: Expanded(
              flex: 1,
              child: LogoutBotton(),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 50,
            ),
          ),
          GestureDetector(
            child: Expanded(
              flex: 1,
              child: BackIconBotton(),
            ),
          ),
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
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
            'images/person.png',
            color: Colors.black54,
            height: 50,
            width: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$title',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}

class CardBtns extends StatelessWidget {
  const CardBtns({
    Key? key,
    required this.btnName,
  }) : super(key: key);

  final String btnName;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          alignment: Alignment.center,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      child: Text(
        '$btnName',
        style: TextStyle(
            color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }
}

// Size displaySize(BuildContext context) {
//   debugPrint('Size = ' + MediaQuery.of(context).size.toString());
//   return MediaQuery.of(context).size;
// }

// double displayHeight(BuildContext context) {
//   debugPrint('Height = ' + displaySize(context).height.toString());
//   return displaySize(context).height;
// }

// double displayWidth(BuildContext context) {
//   debugPrint('Width = ' + displaySize(context).width.toString());
//   return displaySize(context).width;
// }

class BackIconBotton extends StatelessWidget {
  const BackIconBotton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
        icon:
            Icon(Icons.arrow_back_rounded, size: 25, color: Colors.blueAccent),
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        },
      ),
    );
  }
}

class LogoutBotton extends StatelessWidget {
  const LogoutBotton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromARGB(255, 50, 167, 230),
              Color.fromARGB(255, 194, 44, 231),
            ],
          ),
        ),
        child: Center(
          child: Text(
            'Logout',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
