import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/myhomepage.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class PinScreen extends StatefulWidget {
  PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  late TextEditingController _num1textcontroller;
  late TextEditingController _num2textcontroller;
  late TextEditingController _num3textcontroller;
  late TextEditingController _num4textcontroller;
  late TextEditingController _num5textcontroller;
  late TextEditingController _num6textcontroller;

  @override
  void initState() {
    _num1textcontroller = TextEditingController();
    _num2textcontroller = TextEditingController();
    _num3textcontroller = TextEditingController();
    _num4textcontroller = TextEditingController();
    _num5textcontroller = TextEditingController();
    _num6textcontroller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
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
                color: Colors.purple.withOpacity(0.6),
                color1: Colors.purple.withOpacity(0.6),
                spreadradius: 03,
                blurradius: 05,
                negativeOffsetx: -1.0,
                negativeOffsety: -1.0,
                offsetx: 08.5,
                offsety: 08.8,
                radius: 190,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 8),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                customCodeLable(hint: "2", textcontroller: _num1textcontroller),
                customCodeLable(hint: "5", textcontroller: _num2textcontroller),
                customCodeLable(hint: "2", textcontroller: _num3textcontroller),
                customCodeLable(hint: "4", textcontroller: _num4textcontroller),
                customCodeLable(hint: "8", textcontroller: _num5textcontroller),
                customCodeLable(hint: "3", textcontroller: _num6textcontroller),
              ]),
              SizedBox(height: MediaQuery.of(context).size.height / 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/resend.png",
                    height: 22,
                    width: 22,
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
                  child:
                      AnimatedLongButton(text: "Send", isBgColorWhite: true)),
            ],
          ),
        ),
      ),
    );
  }

  Widget customCodeLable(
      {required TextEditingController textcontroller, required String hint}) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 50,
        width: 50,
        child: TextField(
          textAlign: TextAlign.center,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 14),
          controller: textcontroller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey.withOpacity(0.8),
                ),
            border: InputBorder.none,
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.3),
                  blurRadius: 4,
                  spreadRadius: 04,
                  offset: Offset(3, 5)),
            ]),
      ),
    );
  }
}
