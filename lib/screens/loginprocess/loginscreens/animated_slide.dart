import 'package:flutter/material.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/myhomepage.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class AnimatedSlideScreen extends StatefulWidget {
  AnimatedSlideScreen({Key? key}) : super(key: key);
  @override
  State<AnimatedSlideScreen> createState() => _AnimatedSlideScreenState();
}

class _AnimatedSlideScreenState extends State<AnimatedSlideScreen>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);
  late AnimationController _controller, _repeatcontroller;
  late Animation<Size> growAnimation;
  late Animation<Offset> offset;
  late Animation<double> animateup, _intervaltween, animateuprepeat;

  @override
  void initState() {
    //controller repeat
    _repeatcontroller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    animateuprepeat = Tween<double>(begin: 0.3, end: 0.7).animate(
        CurvedAnimation(
            parent: _repeatcontroller, curve: Curves.easeInOutExpo));
    _intervaltween = Tween<double>(begin: 0.4, end: 0.7).animate(
      CurvedAnimation(
        parent: _repeatcontroller,
        curve: Interval(
          0.7,
          1.0,
          curve: Curves.bounceIn,
        ),
      ),
    );
    //controller forword
    _controller = AnimationController(vsync: this, duration: _duration);
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(_controller);
    animateup = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));

    // _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Size size(context) {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print("Height of screen :$size.height");
    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
          animation: _controller.view,
          builder: (context, child) {
            return Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/images/background.png",
                  ),
                ),
              ),
              child: SlideableWidget(
                actionThreshold: 0.1,
                // background: Container(
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       fit: BoxFit.fill,
                //       image: AssetImage(
                //         "assets/images/background.png",
                //       ),
                //     ),
                //   ),
                // ),
                child: builldSlidecntent(context),
                onSlided: () {
                  setState(() {
                    _showModalBottomSheet();
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget builldSlidecntent(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          spacer(size: size.height / 7),
          Transform(
            transform: Matrix4.translationValues(
                0.0, animateup.value * size.height / 2, 0.0),
            child: Text("THE ACCOUNT",
                style: Theme.of(context).textTheme.subtitle1),
          ),
          spacer(),
          Transform(
            transform: Matrix4.translationValues(
                0.0, animateup.value * size.height / 2, 0.0),
            child: Center(
                child: Image.asset(
              "assets/images/logo1.png",
              height: size.height / 5.5,
              width: size.height / 5.5,
            )),
          ),
          spacer(),
          Transform(
            transform: Matrix4.translationValues(
                0.0, animateup.value * size.height / 2, 0.0),
            child: AnimatedBuilder(
                animation: _repeatcontroller.view,
                builder: (context, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform(
                        transform: Matrix4.translationValues(
                            0.0, animateuprepeat.value * 10, 0.0),
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xffC6A2FE),
                                Color(0xff68B8F9),
                              ]),
                              shape: BoxShape.circle),
                          child: Icon(Icons.arrow_upward, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                            0.0, _intervaltween.value * 10, 0.0),
                        child: Text(
                          "Swipe up to Login",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Spacer(flex: 01),
        ],
      ),
    );
  }

  SizedBox spacer({double? size}) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: size ?? height / 5.4,
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

class SlideableWidget extends StatefulWidget {
  const SlideableWidget(
      {this.child,
      required this.actionThreshold,
      this.background,
      required this.onSlided,
      Key? key})
      : super(key: key);

  final VoidCallback onSlided;
  final Widget? child;
  final Widget? background;
  final double actionThreshold;

  @override
  State<SlideableWidget> createState() => _SlideableWidgetState();
}

class _SlideableWidgetState extends State<SlideableWidget>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);
  late AnimationController _controller;
  late Animation<Size> growAnimation;
  late Animation<Offset> offset;
  late Animation<double> animateup, animateuprepeat;
  double _dragExtent = 0;
  Size size = Size(0, 0);
  @override
  void initState() {
    //controller forword
    _controller = AnimationController(vsync: this, duration: _duration);
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(_controller);
    animateup = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));

    // _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onVerticalDragStart: onDragStart,
      onVerticalDragUpdate: onDragUpdate,
      onVerticalDragEnd: onDragEnd,
      child: Container(
        child: Stack(
          children: [
            SizedBox(
              child: widget.background,
              width: size.width,
              height: size.height,
            ),
            AnimatedBuilder(
              animation: _controller.view,
              builder: (context, child) {
                return SlideTransition(
                  position:
                      AlwaysStoppedAnimation(Offset(0.0, -_controller.value)),
                  child: widget.child,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  onDragStart(DragStartDetails details) {
    setState(() {
      size = context.size!;
      _dragExtent = 0;
      _controller.reset();
    });
  }

  // void onDragUpdate(details) {
  //   print('Value : ${details.globalPosition.dy}');
  //   // _controller.forward();
  //   setState(() {
  //     if (details.globalPosition.dy > 100) _showModalBottomSheet();
  //   });
  // }
  onDragUpdate(DragUpdateDetails details) {
    _dragExtent += details.primaryDelta!;
    if (_dragExtent >= 0) {
      return;
    }

    setState(() {
      _controller.value = _dragExtent.abs() / context.size!.width;
    });
  }

  onDragEnd(DragEndDetails details) {
    if (_controller.value > widget.actionThreshold) {
      widget.onSlided();
    }
    _controller.fling(velocity: -1);
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
