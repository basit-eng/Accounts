import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/loginprocess/components/widgets.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/showcapital.screen.dart';
import 'package:theaccounts/screens/loginprocess/components/inputfield.widget.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/pin_screen.dart';

class ForgetPsswordScreen extends StatefulWidget {
  const ForgetPsswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgetpassword-screen';

  @override
  State<ForgetPsswordScreen> createState() => _ForgetPsswordScreenState();
}

class _ForgetPsswordScreenState extends State<ForgetPsswordScreen> {
  late TextEditingController _otptextcontroller;

  @override
  void initState() {
    _otptextcontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              alignment: Alignment.topRight,
              child: BackIconBotton(),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                child: Image.asset(
                  'assets/images/unlock.png',
                  color: Color.fromARGB(255, 67, 153, 223),
                ),
                margin: EdgeInsets.only(top: 40),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 40, 145, 231),
                      spreadRadius: 10,
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
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: CustomInputField(
                  hint: "Enter your Otp",
                  textcontroller: _otptextcontroller.text,
                  icon: Icons.person_outline_outlined),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Enter your user Id and will send you \ninstructions on how to reset it.',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.visible,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PinScreen(),
                  ),
                );
              },
              child: CustomButton(title: 'Send'),
            ),
          ],
        ),
      ),
    );
  }
}

class BackIconBotton extends StatelessWidget {
  const BackIconBotton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          size: 26,
          color: Color(0xFF90278E),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
