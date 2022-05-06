import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/dashboard.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/myhomepage.dart';
import 'package:theaccounts/screens/setting/setting.dart';

//Animated bottomBar
class AnimatedBottomBar extends StatefulWidget {
  AnimatedBottomBar({Key? key}) : super(key: key);

  @override
  State<AnimatedBottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<AnimatedBottomBar>
    with SingleTickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);

  late AnimationController _controller;
  late Animation<double> _animopacity;
  late Animation<double> _animateleft, _animateright;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _duration);

    _animopacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _animateleft = Tween<double>(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _animateright = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.forward();
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
    double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return Container(
          height: 100,
          width: size.width,
          color: Colors.transparent,
          margin: EdgeInsets.only(bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Transform(
                transform: Matrix4.translationValues(
                    _animateleft.value * width, 0.0, 0.0),
                child: AnimatedOpacity(
                  duration: _duration,
                  opacity: _animopacity.value,
                  child: GestureDetector(
                    onTap: () {
                      print(" go to Hide Capital Screen");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    },
                    child: AnimatedCircularButton(color: [
                      Theme.of(context).cardColor,
                      Theme.of(context).cardColor
                    ], Icon: Icon(Icons.logout), text: "Log Out"),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(
                    0.0, _animateleft.value * width, 0.0),
                child: AnimatedOpacity(
                  duration: _duration,
                  opacity: _animopacity.value,
                  child: DashboardButton(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("----Pressed.. go to Setting");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashBoardScreen(),
                    ),
                  );
                },
                child: Transform(
                  transform:
                      Matrix4.translationValues(_animateright.value, 0.0, 0.0),
                  child: AnimatedOpacity(
                    duration: _duration,
                    opacity: _animopacity.value,
                    child: GestureDetector(
                      onTap: () {
                        print("----Pressed.. go to Setting");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingScreen(),
                          ),
                        );
                      },
                      child: AnimatedCircularButton(color: [
                        Theme.of(context).cardColor,
                        Theme.of(context).cardColor
                      ], Icon: Icon(Icons.settings), text: "Setting"),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

//Animated circular bar

class AnimatedCircularBar extends StatefulWidget {
  AnimatedCircularBar({required this.title, this.radius, Key? key})
      : super(key: key);

  final String title;
  final double? radius;

  @override
  State<AnimatedCircularBar> createState() => _AnimatedCircularBarState();
}

class _AnimatedCircularBarState extends State<AnimatedCircularBar>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);

  late AnimationController _controller;
  late Animation<double> _animateright;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: _duration);

    _animateright = Tween<double>(begin: 0.9, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return Transform.scale(
          scale: _animateright.value,
          child: child,
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: widget.radius != null ? 180 : 190,
        width: widget.radius != null ? 180 : 190,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Color(0xFFC22ED0),
                spreadRadius: widget.radius ?? 14,
                blurRadius: 20,
                blurStyle: BlurStyle.outer),
          ],
        ),
        child: Text(
          widget.title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class AnimatedTopBarTile extends StatefulWidget {
  const AnimatedTopBarTile({Key? key}) : super(key: key);

  @override
  State<AnimatedTopBarTile> createState() => _AnimatedTopBarTileState();
}

class _AnimatedTopBarTileState extends State<AnimatedTopBarTile>
    with SingleTickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);
  late AnimationController _topBarController;
  late Animation<double> _intervaltween, _animateleft, _animateopacity;

  //     ,
  // _intervalIcontween;

  @override
  void initState() {
    _topBarController = AnimationController(vsync: this, duration: _duration);
    _animateleft = Tween<double>(begin: -2.0, end: 0.0).animate(
        CurvedAnimation(parent: _topBarController, curve: Curves.easeInBack));
    _animateopacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _topBarController, curve: Curves.easeInBack));
    _intervaltween = Tween<double>(begin: 2.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _topBarController,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _topBarController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _topBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _topBarController.view,
      builder: (context, child) {
        return ListTile(
          contentPadding: EdgeInsets.all(0),
          horizontalTitleGap: 0.0,
          leading: Transform(
            transform:
                Matrix4.translationValues(_animateleft.value * width, 0.0, 0.0),
            child: Icon(Icons.shopping_bag),
          ),
          title: Row(
            children: [
              Transform(
                transform: Matrix4.translationValues(
                    _animateleft.value * width, 0.0, 0.0),
                child: Text(
                  "THE",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(
                    _animateleft.value * width, 0.0, 0.0),
                child: Text(
                  "\t ACCOUNTS",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.purple,
                  ),
                ),
              )
            ],
          ),
          trailing: Transform(
            transform: Matrix4.translationValues(
                _intervaltween.value * width, 0.0, 0.0),
            child: Icon(Icons.notifications),
          ),
        );
      },
    );
  }
}

class DashboardButton extends StatefulWidget {
  const DashboardButton({Key? key}) : super(key: key);

  @override
  State<DashboardButton> createState() => _DashboardButtonState();
}

class _DashboardButtonState extends State<DashboardButton>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);

  late AnimationController _topBarController;

  @override
  void initState() {
    _topBarController = AnimationController(vsync: this, duration: _duration);

    _topBarController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _topBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _topBarController.view,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            print("Pressed.. go to DashBoard");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashBoardScreen(),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClayContainer(
                    spread: 4.0,
                    surfaceColor: Theme.of(context).cardColor.withOpacity(1),
                    height: 70,
                    width: 70,
                    borderRadius: 90,
                    depth: -80,
                    curveType: CurveType.concave,
                  ),
                  ClayContainer(
                    surfaceColor: Theme.of(context).cardColor.withOpacity(1),
                    spread: 4.0,

                    height: 55,
                    width: 55,
                    borderRadius: 90,
                    // depth: 80,
                    // surfaceColor: Theme.of(context).backgroundColor,
                  ),
                  Icon(Icons.dashboard)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "DashBoard",
              )
            ],
          ),
        );
      },
    );
  }
}

class AnimatedLongButton extends StatefulWidget {
  AnimatedLongButton(
      {required this.text, this.color, Key? key, required this.isBgColorWhite})
      : super(key: key);

  final String text;
  final List<Color>? color;
  final bool isBgColorWhite;

  @override
  State<AnimatedLongButton> createState() => _AnimatedLongButtonState();
}

class _AnimatedLongButtonState extends State<AnimatedLongButton>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);

  late AnimationController _animationcontroller;
  late Animation<double> _animateopacity;
  late Animation<double> _animateleft;
  //  _animateright;
  @override
  void initState() {
    _animationcontroller =
        AnimationController(vsync: this, duration: _duration);

    _animateopacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationcontroller, curve: Curves.fastOutSlowIn));
    _animateleft = Tween<double>(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationcontroller, curve: Curves.fastOutSlowIn));

    _animationcontroller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _animationcontroller.view,
        builder: (context, child) {
          return Container(
            height: 50,
            width: 270,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurStyle: BlurStyle.outer,
                  blurRadius: 10,
                  spreadRadius: 0.0,
                  offset: Offset(0.5, 00),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: widget.color ?? [Colors.white, Colors.white],
              ),
            ),
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, _animateleft.value * width, 0.0),
              child: AnimatedOpacity(
                duration: _duration,
                opacity: _animateopacity.value,
                child: Text(
                  widget.text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: widget.isBgColorWhite
                            ? Colors.black.withOpacity(0.7)
                            : Colors.white.withOpacity(1.0),
                      ),
                ),
              ),
            ),
          );
        });
  }
}

class AnimatedAlertDialog extends StatefulWidget {
  AnimatedAlertDialog({this.color, this.description, Key? key})
      : super(key: key);

  final List<Color>? color;
  final String? description;

  @override
  State<AnimatedAlertDialog> createState() => _AnimatedAlertDialogState();
}

class _AnimatedAlertDialogState extends State<AnimatedAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget.color ?? [Color(0xFFB7EE9C), Color(0xFF0ABCED)],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 3,
              color: Colors.white.withOpacity(0.9),
              endIndent: 170,
              indent: 170,
              thickness: 4,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Alert',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(1.0),
                  ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedCircularButton(
                      Icon: Icon(Icons.warning_amber_outlined)),
                  SizedBox(
                    width: 260,
                    height: 60,
                    child: Text(
                      widget.description ?? "",
                      maxLines: 2,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5),
                          ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: AnimatedLongButton(
                        text: "CLOSE",
                        isBgColorWhite: true,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//small circular animaated button
class AnimatedCircularButton extends StatefulWidget {
  AnimatedCircularButton({this.text, required this.Icon, this.color, Key? key})
      : super(key: key);

  final String? text;
  final Widget Icon;
  final List<Color>? color;
  @override
  State<AnimatedCircularButton> createState() => _AnimatedCircularButtonState();
}

class _AnimatedCircularButtonState extends State<AnimatedCircularButton> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          margin: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(90),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                // color: Colors.green,
                // blurStyle: BlurStyle.outer,
                blurRadius: 3,
                spreadRadius: 3,
                offset: Offset(3, 4),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: widget.color ?? [Colors.transparent, Colors.transparent],
            ),
          ),
          child: widget.Icon,
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 80,
          child: Text(
            widget.text ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(overflow: TextOverflow.visible, height: 1.3),
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

//Animated title tile
class AnimatedTitle extends StatefulWidget {
  AnimatedTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedTitle> createState() => _AnimatedTitleState();
}

class _AnimatedTitleState extends State<AnimatedTitle>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);

  late AnimationController _controller;
  late Animation<double> _animateleft, _animateopacity;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _duration);

    _animateleft = Tween<double>(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _animateopacity = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _controller.view,
        builder: (context, child) {
          return ListTile(
            title: Transform(
              transform: Matrix4.translationValues(
                  _animateleft.value * size, 0.0, 0.0),
              child: AnimatedOpacity(
                duration: _duration,
                opacity: _animateopacity.value,
                child: Text(
                  "Good Morning",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.withOpacity(0.8)),
                ),
              ),
            ),
            subtitle: Transform(
              transform: Matrix4.translationValues(
                  _animateleft.value * size, 0.0, 0.0),
              child: AnimatedOpacity(
                duration: _duration,
                opacity: _animateopacity.value,
                child: Text("Khurram Shahbaz",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.6)),
              ),
            ),
          );
        });
  }
}
