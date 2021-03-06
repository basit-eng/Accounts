import 'package:flutter/material.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

import '../custom.widgets/custom.widgets.dart';

class RollOverScreen extends StatefulWidget {
  const RollOverScreen({Key? key}) : super(key: key);
  static const routeName = '/rollover-screen';

  @override
  State<RollOverScreen> createState() => _RollOverScreenState();
}

class _RollOverScreenState extends State<RollOverScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: widgets.bottombar(context: context),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Hello User",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SingleChildScrollView(child: RollOverBottomSheet())
            ],
          ),
        ),
      ),
    );
  }
}

//bottom sheet
class RollOverBottomSheet extends StatefulWidget {
  const RollOverBottomSheet({Key? key}) : super(key: key);

  @override
  State<RollOverBottomSheet> createState() => _RollOverBottomSheetState();
}

class _RollOverBottomSheetState extends State<RollOverBottomSheet>
    with TickerProviderStateMixin {
  final _duration = Duration(milliseconds: 1500);

  late AnimationController _animationcontroller;
  late Animation<double> _animateopacity;
  late Animation<double> _animateleft;

  late TextEditingController _rolloveramounttextcontroller;
  @override
  void initState() {
    _rolloveramounttextcontroller = TextEditingController();

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
    double height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
        animation: _animationcontroller.view,
        builder: (context, _) {
          return Transform(
            transform:
                Matrix4.translationValues(0.0, _animateleft.value * width, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.6,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF34C5F6), Color(0xFFCDA1FF)],
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
                    Transform(
                      transform: Matrix4.translationValues(
                          0.0, _animateleft.value * width, 0.0),
                      child: AnimatedOpacity(
                        duration: _duration,
                        opacity: _animateopacity.value,
                        child: Text(
                          "All RollOver",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Transform(
                                  transform: Matrix4.translationValues(
                                      _animateleft.value * width, 0.0, 0.0),
                                  child: AnimatedOpacity(
                                    duration: _duration,
                                    opacity: _animateopacity.value,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.payments,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 08,
                                          ),
                                          Text(
                                            "Amount",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 04,
                              ),
                              AmountInputField(
                                Prefixtext: "Rs",
                                isBgColorWhite: true,
                                textcontroller: _rolloveramounttextcontroller,
                                hint: '22,000,000',
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Pressesed.. Moved to Show Capital screen");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RollOvertransectiondetailwidget(),
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
            ),
          );
        });
  }
}

//transection detail sheet
class RollOvertransectiondetailwidget extends StatefulWidget {
  RollOvertransectiondetailwidget({Key? key}) : super(key: key);

  @override
  State<RollOvertransectiondetailwidget> createState() =>
      _RollOvertransectiondetailwidgetState();
}

class _RollOvertransectiondetailwidgetState
    extends State<RollOvertransectiondetailwidget> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Transection Details",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(08),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF3BC2F6),
                          Color(0xFFCD93FF),
                        ],
                      ),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(14)),
                    ),
                    child: ListTile(
                        leading: Image.asset(
                          'assets/images/tick.png',
                          height: 38,
                          width: 38,
                        ),
                        // Theme.of(context).iconTheme.color,
                        // ),
                        title: SizedBox(
                          width: 60,
                          child: Text(
                            "Rollover Request has been Processed",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                          ),
                        ),
                        trailing: Image.asset(
                          'assets/images/cross.png',
                          height: 25,
                          width: 25,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "User Id",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 13.41, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "2345",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 13.41, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
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
                                    fontSize: 13.41,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            onPressed: () => _selectDate(context),
                          ),
                        )
                      ],
                    ),
                  ),
                  divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Closing Payment",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 13.41, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "6,500,000",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RollOver Amount",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 13.41, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rs :",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.6),
                            ),
                      ),
                      Text(
                        "160,000,000",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.6),
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Pressesed.. Moved to back");
                      Navigator.pop(context);
                    },
                    child: AnimatedLongButton(
                      text: "CLOSED",
                      color: [Color(0xFF33C5F6), Color(0xFFCD93FF)],
                      isBgColorWhite: false,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
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
