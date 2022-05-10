import 'package:flutter/material.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';

class WithDrawPaymentAlert extends StatefulWidget {
  WithDrawPaymentAlert({Key? key}) : super(key: key);
  static const routeName = '/withdraw_alert-screen';

  @override
  State<WithDrawPaymentAlert> createState() => _WithDrawPaymentAlertState();
}

class _WithDrawPaymentAlertState extends State<WithDrawPaymentAlert>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 2000);

  late AnimationController _controller;
  late Animation<double> _animateleft, _animateright;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: _duration);

    _animateleft = Tween<double>(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _animateright = Tween<double>(begin: 2.0, end: 0.0).animate(
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
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: AnimatedBuilder(
          animation: _controller.view,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.translationValues(
                  0.0, _animateright.value * width, 0.0),
              child: child,
            );
          },
          child: Container(
            alignment: Alignment.bottomCenter,
            child: AnimatedAlertDialog(
              description:
                  "with draw request has been closed.\n Please try on (Closing) ",
            ),
          ),
        ),
      ),
    );
  }
}

class ClosingPaymentAlert extends StatefulWidget {
  ClosingPaymentAlert({Key? key}) : super(key: key);
  static const routeName = '/closing_alert-screen';

  @override
  State<ClosingPaymentAlert> createState() => _ClosingPaymentAlertState();
}

class _ClosingPaymentAlertState extends State<ClosingPaymentAlert>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 2000);

  late AnimationController _controller;
  late Animation<double> _animateleft, _animateright;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: _duration);

    _animateleft = Tween<double>(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _animateright = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: AnimatedBuilder(
        animation: _controller.view,
        builder: (context, child) {
          return AnimatedAlign(
            alignment: Alignment.bottomCenter,
            duration: _duration,
            child: child,
          );
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          child: AnimatedAlertDialog(
            description:
                "Closing Payment request has \n been sent for further action.) ",
            color: [Color(0xFFFEA64C), Color(0xFFBE3C95)],
          ),
        ),
      ),
    ));
  }
}
