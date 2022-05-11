import 'package:flutter/material.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/myhomepage.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class PinScreen extends StatefulWidget {
  PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTopBar(topbartitle: ""),
            AnimatedCircularBar(
              child: Center(
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset(
                    "assets/images/point_hand.png",
                  ),
                ),
              ),
              color: Colors.blue.withOpacity(0.6),
              color1: Colors.blue.withOpacity(0.6),
              spreadradius: 04,
              blurradius: 08,
              negativeOffsetx: -1.0,
              negativeOffsety: -1.0,
              offsetx: 12.5,
              offsety: 12.8,
              radius: 190,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customCodeLable(number: 2),
                customCodeLable(number: 0),
                customCodeLable(number: 7),
                customCodeLable(number: 1),
                customCodeLable(number: 9),
                customCodeLable(number: 1),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/resend.png",
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Resend",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                child: AnimatedLongButton(text: "Send", isBgColorWhite: true)),
          ],
        ),
      ),
    );
  }

  Widget customCodeLable({required int number}) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        child: Center(
            child: Text(
          number.toString(),
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black54),
        )),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: 04,
                  offset: Offset(3, 3)),
            ]),
      ),
    );
  }
}
