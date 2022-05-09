import 'package:flutter/material.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/myhomepage.dart';

class AnimatedSlideScreen extends StatefulWidget {
  AnimatedSlideScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedSlideScreen> createState() => _AnimatedSlideScreenState();
}

class _AnimatedSlideScreenState extends State<AnimatedSlideScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/background.png",
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spacer(
                flex: 01,
              ),
              Text("THE ACCOUNT", style: Theme.of(context).textTheme.subtitle1),
              Spacer(
                flex: 01,
              ),
              Center(
                  child: Image.asset(
                "assets/images/logo1.png",
                height: 150,
                width: 150,
              )),
              Spacer(
                flex: 01,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (() {
                      _showModalBottomSheet();
                      print("Pop Up");
                    }),
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xff68B8F9), Color(0xffC6A2FE)]),
                          shape: BoxShape.circle),
                      child: Icon(Icons.arrow_upward, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Swipe up to Login",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Spacer(flex: 01),
            ],
          ),
        ),
      ),
    );
  }

  _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        bool isSwitch = false;
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 400,
            child: Column(
              children: [
                Expanded(
                  flex: 04,
                  child: Container(
                    height: 250,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Switch(
                              value: isSwitch,
                              onChanged: (value) {
                                isSwitch = !isSwitch;
                                // isSwitch=true;
                                setState(() {
                                  isSwitch = value;
                                });
                              }),
                          Text("Fingure Authentication",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              )),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 55),
                          Text(
                            "Please login to get access",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 55),
                          Text(
                            "Scan your Finger Print",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 28),
                          Container(
                            height: 24,
                            width: 115,
                            child: ElevatedButton(
                              child: Text(
                                "CANCLE",
                                style: TextStyle(color: Colors.purple),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 01,
                  child: Container(
                    child: Image.asset(
                      "assets/images/fin_print.png",
                      height: 10,
                      width: 10,
                    ),
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
