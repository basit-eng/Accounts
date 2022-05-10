import 'package:flutter/material.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/myhomepage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class AnimatedSlideScreen extends StatefulWidget {
  AnimatedSlideScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedSlideScreen> createState() => _AnimatedSlideScreenState();
}

class _AnimatedSlideScreenState extends State<AnimatedSlideScreen>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 500);

  late AnimationController _controller;
  late Animation<double> animateup, _intervaltween;

  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });
    _controller = AnimationController(vsync: this, duration: _duration);

    animateup = Tween<double>(begin: 0.5, end: 0.7)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));

    _intervaltween = Tween<double>(begin: 0.4, end: 0.7).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.7,
          1.0,
          curve: Curves.bounceIn,
        ),
      ),
    );

    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();

    super.dispose();
  }

  List _tabs = ["Finger Print", "Face"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
            animation: _controller.view,
            builder: (context, snapshot) {
              return Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
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
                      Text("THE ACCOUNT",
                          style: Theme.of(context).textTheme.subtitle1),
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
                            child: Transform(
                              transform: Matrix4.translationValues(
                                  0.0, _intervaltween.value * 20, 0.0),
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xff68B8F9),
                                      Color(0xffC6A2FE)
                                    ]),
                                    shape: BoxShape.circle),
                                child: Icon(Icons.arrow_upward,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                0.0, animateup.value * 15, 0.0),
                            child: Text(
                              "Swipe up to Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                      Spacer(flex: 01),
                    ],
                  ));
            }),
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
                  flex: 05,
                  child: Container(
                    // height: 250,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 35,
                                width: double.maxFinite,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 50),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(36),
                                  // gradient: LinearGradient(colors: [
                                  //   _selectedIndex == i
                                  //       ? Colors.blue
                                  //       : Colors.white,
                                  // ])
                                ),
                                child: TabBar(
                                    controller: _tabController,
                                    labelColor: Theme.of(context).cardColor,
                                    labelStyle: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    indicatorColor: Colors.transparent,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    tabs: [
                                      for (int i = 0; i < _tabs.length; i++)
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(_tabs[i],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2),
                                          // padding: const EdgeInsets.symmetric(
                                          //     vertical: 4, horizontal: 4),
                                          decoration: BoxDecoration(
                                            color: _selectedIndex == i
                                                ? Colors.blue
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(36),
                                            // gradient: LinearGradient(colors: [
                                            //   _selectedIndex == i
                                            //       ? Colors.blue
                                            //       : Colors.white,
                                            // ])
                                          ),
                                        ),
                                    ]),
                              ),
                              Container(
                                height: 200,
                                width: double.maxFinite,
                                child: Expanded(
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      Container(
                                        child: Column(
                                          // mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Spacer(),
                                            Text("Fingure Authentication",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                )),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    55),
                                            Text(
                                              "Please login to get access",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    55),
                                            Text(
                                              "Scan your Finger Print",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            // SizedBox(
                                            //     height: MediaQuery.of(context)
                                            //             .size
                                            //             .height /
                                            //         28),
                                            Container(
                                              height: 24,
                                              width: 115,
                                              child: ElevatedButton(
                                                child: Text(
                                                  "CANCLE",
                                                  style: TextStyle(
                                                      color: Colors.purple),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      curve: Curves.easeIn,
                                                      type: PageTransitionType
                                                          .size,
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: MyHomePage(),
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Spacer()
                                          ],
                                        ),
                                      ),
                                      Container(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
