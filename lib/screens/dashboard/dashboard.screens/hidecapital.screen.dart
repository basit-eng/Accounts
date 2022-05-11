import 'package:flutter/material.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/closingPayment.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/rollover.screen.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/showcapital.screen.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/withdrawbotttomsheet.dart';

import '../custom.widgets/custom.widgets.dart';

class HideCapitalScreen extends StatefulWidget {
  HideCapitalScreen({Key? key}) : super(key: key);
  static const routeName = '/hidecapital-screen';

  @override
  State<HideCapitalScreen> createState() => _HideCapitalScreenState();
}

class _HideCapitalScreenState extends State<HideCapitalScreen>
    with SingleTickerProviderStateMixin {
  final _duration = Duration(milliseconds: 2000);
  late AnimationController _animController;
  late Animation<double> _animleft;
  late Animation<double> _opacity;
  late Animation<double> _animright;

  @override
  void initState() {
    _animController = AnimationController(vsync: this, duration: _duration);

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animController, curve: Curves.fastOutSlowIn));
    _animleft = Tween<double>(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _animController, curve: Curves.fastOutSlowIn));
    _animright = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _animController, curve: Curves.fastOutSlowIn));

    _animController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: AnimatedBottomBar(),
        backgroundColor: Theme.of(context).cardColor,
        body: AnimatedBuilder(
          animation: _animController.view,
          builder: (context, child) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AnimatedTopBarTile(),
                    AnimatedTitle(
                        trailing: Transform(
                      transform: Matrix4.translationValues(
                          _animright.value * width, 0.0, 0.0),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xFF707070),
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                    )),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                print(" go to Show Capital Screen");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShowCapitalScreen(),
                                  ),
                                );
                              },
                              child: AnimatedCircularBar(
                                  child: Text("Hide Capital",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  color: Colors.blue.withOpacity(0.6),
                                  color1: Colors.purple.withOpacity(0.6),
                                  spreadradius: 04,
                                  blurradius: 08,
                                  negativeOffsetx: -6.8,
                                  negativeOffsety: -6.5,
                                  offsetx: 6.5,
                                  offsety: 6.8,
                                  radius: 200),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                0.0, _animleft.value * width, 0.0),
                            child: AnimatedOpacity(
                              duration: _duration,
                              opacity: _opacity.value,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rs:\t",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    "25,500,000",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Transform(
                                transform: Matrix4.translationValues(
                                    _animleft.value * width, 0.0, 0.0),
                                child: AnimatedOpacity(
                                  duration: _duration,
                                  opacity: _opacity.value,
                                  child: GestureDetector(
                                    onTap: () {
                                      print(
                                          "Pressesed.. Go to withDraw Screen Layer");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return WithDrawHoverLayerScreen();
                                        }),
                                      );
                                    },
                                    child: AnimatedCircularButton(
                                        text: "Withdraw capital",
                                        Icon: Center(
                                          child: SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(
                                              "assets/images/withdraw_capital.png",
                                            ),
                                          ),
                                        ),
                                        color: [
                                          Color(0xFF65FDF0),
                                          Color(0xFF1D6FA3)
                                        ]),
                                  ),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    0.0, _animleft.value * width, 0.0),
                                child: AnimatedOpacity(
                                  duration: _duration,
                                  opacity: _opacity.value,
                                  child: GestureDetector(
                                    onTap: () {
                                      print(
                                          "Pressesed.. Go to Transection Screen");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return ClosingPaymentScreen();
                                        }),
                                      );
                                    },
                                    child: AnimatedCircularButton(
                                        text: "Closing Payment",
                                        Icon: Center(
                                          child: SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(
                                              "assets/images/closing_payments.png",
                                            ),
                                          ),
                                        ),
                                        color: [
                                          Color(0xFFF6D242),
                                          Color(0xFFFF52E5)
                                        ]),
                                  ),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    _animright.value * width, 0.0, 0.0),
                                child: AnimatedOpacity(
                                  duration: _duration,
                                  opacity: _opacity.value,
                                  child: GestureDetector(
                                    onTap: () {
                                      print("Pressesed.. Go to All RollOver");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return RollOverScreen();
                                        }),
                                      );
                                    },
                                    child: AnimatedCircularButton(
                                        text: "All RollOver",
                                        Icon: Center(
                                          child: SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(
                                              "assets/images/allroll_over.png",
                                            ),
                                          ),
                                        ),
                                        color: [
                                          Color(0xFF72EDF2),
                                          Color(0xFF5151E5)
                                        ]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
