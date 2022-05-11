import 'package:flutter/material.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';

import 'alerts.dart';

class ClosingPaymentScreen extends StatelessWidget {
  ClosingPaymentScreen({Key? key}) : super(key: key);
  static const routeName = '/closing_payment-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Closing Payment"),
        ),
        // bottomNavigationBar: dashboard.bottombar(context: context),
        body: Container(
          alignment: Alignment.bottomCenter,
          child: ClosingPaymentBottomSheet(),
        ),
      ),
    );
  }
}

class ClosingPaymentBottomSheet extends StatefulWidget {
  const ClosingPaymentBottomSheet({Key? key}) : super(key: key);

  @override
  State<ClosingPaymentBottomSheet> createState() =>
      _ClosingPaymentBottomSheetState();
}

class _ClosingPaymentBottomSheetState extends State<ClosingPaymentBottomSheet>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);

  late AnimationController _animationcontroller;
  late Animation _animateopacity;
  late Animation<double> _animateleft, _animateright;
  @override
  void initState() {
    _animationcontroller =
        AnimationController(vsync: this, duration: _duration);

    _animateopacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationcontroller, curve: Curves.fastOutSlowIn));
    _animateleft = Tween<double>(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationcontroller, curve: Curves.fastOutSlowIn));
    _animateright = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFEA64C), Color(0xFFBE3C95)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 05,
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        0.0, _animateleft.value * width, 0.0),
                    child: Text(
                      "Closing Payment",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.8),
                          ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(
                              0.0, _animateleft.value * width, 0.0),
                          child: AnimatedOpacity(
                            duration: _duration,
                            opacity: _animateopacity.value,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rs. ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                ),
                                Text(
                                  "25,500,000",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        fontSize: 20,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform(
                                    transform: Matrix4.translationValues(
                                        _animateleft.value * width, 0.0, 0.0),
                                    child: Icon(
                                      Icons.all_inclusive_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 08,
                                  ),
                                  Transform(
                                    transform: Matrix4.translationValues(
                                        _animateright.value * width, 0.0, 0.0),
                                    child: Text(
                                      "Transfer",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.white.withOpacity(0.8),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 04,
                            ),
                            AnimatedLongButton(
                              Prefixtext: 'Rs. ',
                              text: "35,000,000",
                              isBgColorWhite: true,
                            )
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform(
                                    transform: Matrix4.translationValues(
                                        _animateleft.value * width, 0.0, 0.0),
                                    child: AnimatedOpacity(
                                      duration: _duration,
                                      opacity: _animateopacity.value,
                                      child: Icon(
                                        Icons.settings_backup_restore_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 08,
                                  ),
                                  Transform(
                                    transform: Matrix4.translationValues(
                                        _animateright.value * width, 0.0, 0.0),
                                    child: AnimatedOpacity(
                                      duration: _duration,
                                      opacity: _animateopacity.value,
                                      child: Text(
                                        "RollOver",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                            ),
                                      ),
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
                                    builder: (context) => ClosingPaymentAlert(),
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
                        GestureDetector(
                          onTap: () {
                            print("Pressesed.. popped Alert Dialog appear");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ClosingPaymenttransectiondetailwidget(),
                              ),
                            );
                          },
                          child: AnimatedLongButton(
                            text: "Send Request",
                            isBgColorWhite: true,
                          ),
                        ),
                        AnimatedBottomBar()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

final divider = Divider(
  height: 3,
  color: Colors.white,
  endIndent: 170,
  indent: 170,
  thickness: 3,
);

//closing Payment transection detail widget
class ClosingPaymenttransectiondetailwidget extends StatefulWidget {
  const ClosingPaymenttransectiondetailwidget({Key? key}) : super(key: key);

  @override
  State<ClosingPaymenttransectiondetailwidget> createState() =>
      _ClosingPaymenttransectiondetailwidgetState();
}

class _ClosingPaymenttransectiondetailwidgetState
    extends State<ClosingPaymenttransectiondetailwidget> {
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2080),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.bottomCenter,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(08),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFFEA64C), Color(0xFFBE3C95)],
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                ),
                child: ListTile(
                  leading: Icon(Icons.done, color: Colors.white),
                  // Theme.of(context).iconTheme.color,
                  // ),
                  title: SizedBox(
                    width: 60,
                    child: Text(
                      "Closing Payment Request has been Processed",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  trailing: Icon(Icons.close, color: Colors.white
                      // ?? Theme.of(context).iconTheme.color,
                      ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "User Id",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.41, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "2345",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.41, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.41, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 30,
                      child: TextButton(
                        child: Text(
                          currentDate.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 13.41, fontWeight: FontWeight.w300),
                        ),
                        onPressed: () => _selectDate(context),
                      ),
                    )
                  ],
                ),
              ),
              divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "RollOver",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.41, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "6,500,000",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transfer amount",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Color(0xFF92298D),
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rs. ",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Color(0xFF92298D),
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    "200,000,000",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Color(0xFF92298D),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: AnimatedLongButton(
                  text: "CLOSED",
                  color: [
                    Color(0xFFFF975A),
                    Color(0xFF92298D),
                  ],
                  isBgColorWhite: false,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Divider divider() {
    return Divider(
      indent: 20,
      endIndent: 20,
      color: Colors.grey.withOpacity(0.5),
      thickness: 2,
      height: 1,
    );
  }
}
