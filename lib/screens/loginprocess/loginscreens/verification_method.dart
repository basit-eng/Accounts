import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
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
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AnimatedCircularBar(
                  child: SizedBox(
                    height: 80,
                    width: 72,
                    child: Image.asset(
                      'assets/images/notifi.png',
                      // color: Colors.blue[200],
                    ),
                  ),
                  radius: 170,
                  color: Colors.grey.withOpacity(0.3),
                ),
                SizedBox(
                  height: 70,
                ),
                AnimatedCircularBar(
                  child: SizedBox(
                    height: 72,
                    width: 68,
                    child: Image.asset(
                      'assets/images/message.png',
                    ),
                  ),
                  radius: 170,
                  color: Colors.grey.withOpacity(0.3),
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
