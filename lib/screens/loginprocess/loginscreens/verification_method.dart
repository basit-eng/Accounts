import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/loginprocess/components/widgets.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/dashboard.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/showcapital.screen.dart';

final primaryColor = Color(0xfff1f1f2);

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);
  static const routeName = '/verification-screen';

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color(0xfff1f1f2),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 170,
                  width: 170,
                  child: Image.asset(
                    'assets/images/notifi.png',
                    color: Colors.blue[200],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 15,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(
                          1,
                          1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: 170,
                  width: 170,
                  child: Image.asset(
                    'assets/images/message.png',
                    color: Colors.blue[200],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 15,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(
                          1,
                          1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowCapitalScreen(),
                      ),
                    );
                  },
                  child: CustomButton(
                    title: 'Send',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
