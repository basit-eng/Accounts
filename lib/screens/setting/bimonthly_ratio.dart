import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/hidecapital.screen.dart';

class BimonthlyRatioScreen extends StatefulWidget {
  BimonthlyRatioScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/bi_monthly-screen';

  @override
  State<BimonthlyRatioScreen> createState() => _BimonthlyRatioScreenState();
}

class _BimonthlyRatioScreenState extends State<BimonthlyRatioScreen>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);

  late AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: _duration);

    _controller.forward();
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
          builder: (context, child) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: height,
                width: width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Container(
                    //   child: Transform(
                    //     transform: Matrix4.translationValues(
                    //         0.0, _animateleft.value * width, 0.0),
                    //     child: AnimatedOpacity(
                    //       opacity: _animateright,_animateopactiy.value,
                    //       duration: _duration,
                    //       child: AnimatedTopBarTile(),
                    //     ),
                    //   ),
                    // ),
                    AnimatedTopBarTile(),
                    AnimatedTitle(),
                    Spacer(),
                    Center(
                      child: AnimatedCircularBar(
                        child: Text(
                          "11,000",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        radius: 190,
                      ),
                    ),
                    Spacer(),
                    AnimatedBottomBar(),
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
