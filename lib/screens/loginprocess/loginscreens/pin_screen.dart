import 'package:flutter/material.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/loginprocess/components/inputfield.widget.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/myhomepage.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class PinScreen extends StatefulWidget {
  PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> with TickerProviderStateMixin {
  late TextEditingController _firsttextcontroller;
  late TextEditingController _secondtextcontroller;
  late TextEditingController _thirdtextcontroller;
  late TextEditingController _fourthtextcontroller;
  late TextEditingController _fifthtextcontroller;
  late TextEditingController _sixthtextcontroller;
  bool isVisible = false;

  @override
  void initState() {
    _firsttextcontroller = TextEditingController();
    _secondtextcontroller = TextEditingController();
    _thirdtextcontroller = TextEditingController();
    _fourthtextcontroller = TextEditingController();
    _fifthtextcontroller = TextEditingController();
    _sixthtextcontroller = TextEditingController();
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
                    height: 84,
                    width: 84,
                    child: Image.asset(
                      'assets/images/point_hand.png',
                      color: Colors.purple,
                    ),
                  ),
                ),
                color: Colors.purple.withOpacity(0.6),
                color1: Colors.purple.withOpacity(0.6),
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
                  OtpFetchField(
                    child: CustomInputField(
                      isfieldCircle: true,
                      textcontroller: _firsttextcontroller.text,
                      keyboardtype: TextInputType.number,
                      hint: "2",
                    ),
                  ),
                  OtpFetchField(
                    child: CustomInputField(
                      isfieldCircle: true,
                      textcontroller: _secondtextcontroller.text,
                      keyboardtype: TextInputType.number,
                      hint: "5",
                    ),
                  ),
                  OtpFetchField(
                    child: CustomInputField(
                      isfieldCircle: true,
                      textcontroller: _thirdtextcontroller.text,
                      keyboardtype: TextInputType.number,
                      hint: "6",
                    ),
                  ),
                  OtpFetchField(
                    child: CustomInputField(
                      isfieldCircle: true,
                      textcontroller: _fourthtextcontroller.text,
                      keyboardtype: TextInputType.number,
                      hint: "9",
                    ),
                  ),
                  OtpFetchField(
                    child: CustomInputField(
                      isfieldCircle: true,
                      textcontroller: _fifthtextcontroller.text,
                      keyboardtype: TextInputType.number,
                      hint: "4",
                    ),
                  ),
                  OtpFetchField(
                    child: CustomInputField(
                      isfieldCircle: true,
                      textcontroller: _sixthtextcontroller.text,
                      keyboardtype: TextInputType.number,
                      hint: "8",
                    ),
                  ),
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
                  Text("Resend", style: Theme.of(context).textTheme.bodyText1),
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

  Widget OtpFetchField({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 6,
              blurRadius: 7,
              offset: Offset(3, 6))
        ]),
        child: child,
      ),
    );
  }
}
