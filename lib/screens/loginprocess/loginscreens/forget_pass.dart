import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/loginprocess/components/widgets.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/showcapital.screen.dart';
import 'package:theaccounts/screens/loginprocess/components/inputfield.widget.dart';

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
              alignment: Alignment.topLeft,
              child: BackIconBotton(),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                child: Image.asset(
                  'images/unlock.png',
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
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
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
                      builder: (context) => ShowCapitalScreen(),
                    ),
                  );
                },
                child: CustomButton(title: 'Sign In')),
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
        icon:
            Icon(Icons.arrow_back_rounded, size: 26, color: Colors.blueAccent),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
