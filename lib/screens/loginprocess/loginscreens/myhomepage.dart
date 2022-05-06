import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/loginprocess/components/widgets.dart';
import 'package:theaccounts/screens/loginprocess/components/inputfield.widget.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/verification_method.dart';

import 'forget_pass.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = '/homepage-screen';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ticked = true;

  late TextEditingController _usernametextcontroller;
  late TextEditingController _passwordtextcontroller;
  bool isVisible = false;

  @override
  void initState() {
    _usernametextcontroller = TextEditingController();
    _passwordtextcontroller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              child: Image.asset(
                'images/ot.png',
                color: Color.fromARGB(255, 67, 153, 223),
              ),
              margin: EdgeInsets.only(top: 50),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
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
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: CustomInputField(
                textcontroller: _passwordtextcontroller.text,
                hint: 'Enter your ID',
                icon: Icons.person_outline,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: CustomInputField(
                textcontroller: _usernametextcontroller.text,
                hint: "Enter your Password",
                icon: Icons.lock_outline,
                suffixicon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                      print("Visibility : $isVisible");
                    });
                  },
                  child: Container(
                    child: isVisible
                        ? Icon(Icons.remove_red_eye_outlined)
                        : Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SignedIntext(
              checkbox: Checkbox(
                  value: ticked,
                  onChanged: (Checked) {
                    setState(() {
                      ticked = Checked!;
                      print(
                        "keep me login checked $ticked \t ",
                      );
                    });
                  }),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerificationScreen(),
                  ),
                );
              },
              child: CustomButton(
                title: 'sign In',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetPsswordScreen(),
                    ),
                  );
                },
                child: Text(
                  'Forget Passwrod?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ))
          ],
        )),
      ),
    );
  }

  Widget SignedIntext({required Checkbox checkbox}) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            checkbox,
            Text(
              'Keep me Signed',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
