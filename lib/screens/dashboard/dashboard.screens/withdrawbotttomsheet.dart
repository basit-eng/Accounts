import 'package:flutter/material.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';

import 'alerts.dart';

class WithDrawHoverLayerScreen extends StatefulWidget {
  WithDrawHoverLayerScreen({Key? key}) : super(key: key);
  static const routeName = '/withdraw-screen';

  @override
  State<WithDrawHoverLayerScreen> createState() =>
      _WithDrawHoverLayerScreenState();
}

class _WithDrawHoverLayerScreenState extends State<WithDrawHoverLayerScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      WithDrawBottomSheet();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hello User",
                    style: Theme.of(context).textTheme.headline6),
              ),
              WithDrawBottomSheet()
            ],
          ),
        ),
      ),
    );
  }
}

class WithDrawBottomSheet extends StatefulWidget {
  const WithDrawBottomSheet({Key? key}) : super(key: key);

  @override
  State<WithDrawBottomSheet> createState() => _WithDrawBottomSheetState();
}

class _WithDrawBottomSheetState extends State<WithDrawBottomSheet>
    with SingleTickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);
  late AnimationController _animationController;
  late Animation _animatebottom, _opacity, _intervaltween;
  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _animatebottom = Tween<double>(begin: 2.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Curves.fastLinearToSlowEaseIn));
    _intervaltween = Tween<double>(begin: 2.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _animationController.view,
      builder: (context, child) {
        return Transform(
          transform:
              Matrix4.translationValues(0.0, _animatebottom.value * width, 0.0),
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height * 0.55,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0ABCED), Color(0xFFB7EE9C)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 4,
                color: Colors.white,
                endIndent: 160,
                indent: 160,
                thickness: 4,
              ),
              SizedBox(
                height: 15,
              ),
              AnimatedOpacity(
                duration: _duration,
                opacity: _opacity.value,
                child: Text(
                  "With draw",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.white.withOpacity(1),
                      ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(
                          0.0, _intervaltween.value * width, 0.0),
                      child: AnimatedOpacity(
                        duration: _duration,
                        opacity: _opacity.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Rs:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withOpacity(1),
                                  ),
                            ),
                            Text(
                              "25,500,000",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.attach_money_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 04,
                              ),
                              Text(
                                "Amount",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(1),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 04,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Pressesed.. Moved to with draw capital");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WithDrawPaymentAlert(),
                              ),
                            );
                          },
                          child: AnimatedLongButton(
                            text: "20,000,000",
                            isBgColorWhite: true,
                          ),
                        )
                      ],
                    ),
                    AnimatedLongButton(
                      text: "Send Request",
                      isBgColorWhite: true,
                    ),
                    AnimatedBottomBar()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
