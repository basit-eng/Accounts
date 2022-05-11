import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
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
  final _duration = Duration(milliseconds: 3500);
  late AnimationController _controller;
  late Animation<double> animateup, _intervaltween;
  @override
  void initState() {
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
    super.dispose();
  }

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
        Size size = MediaQuery.of(context).size;
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 05,
              ),
              Container(height: size.height * 0.3, child: AuthenticationTab()),
              SizedBox(height: 08),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.asset(
                    "assets/images/fin_print.png",
                    height: 10,
                    width: 10,
                  ),
                ),
                width: 60,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AuthenticationTab extends StatefulWidget {
  const AuthenticationTab({
    Key? key,
  }) : super(key: key);
  @override
  State<AuthenticationTab> createState() => _AuthenticationTabState();
}

class _AuthenticationTabState extends State<AuthenticationTab>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    _tabController =
        TabController(length: _tabs.length, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List _tabs = ["Finger Print", "Face"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36),
            ),
            child: TabBar(
                controller: _tabController,
                indicatorPadding: EdgeInsets.all(0),
                indicatorWeight: 0.1,
                tabs: [
                  for (int i = 0; i < _tabs.length; i++)
                    Container(
                      width: size.width * 0.4,
                      alignment: Alignment.center,
                      child: Text(
                        _tabs[i],
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: _selectedIndex == i
                                  ? Colors.white.withOpacity(1)
                                  : Colors.black.withOpacity(0.6),
                            ),
                      ),
                      decoration: BoxDecoration(
                        gradient: _selectedIndex == i
                            ? LinearGradient(colors: [
                                Color(0xFF8DF098),
                                Color(0xFF2CA6FF),
                              ])
                            : LinearGradient(colors: [
                                Colors.white,
                                Colors.white,
                              ]),
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                ]),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 05),
                    Text(
                      "Fingure Authentication",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 05),
                    Text(
                      "Please login to get access",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 05),
                    Text(
                      "Scan your Finger Print",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        print(" go tohome page");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      },
                      child: SmallRadiusButton(
                        text: "Cancel",
                        width: 80,
                        height: 24,
                        textcolor: Colors.purple,
                        color: [Colors.white, Colors.white],
                      ),
                    )
                  ],
                ),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
