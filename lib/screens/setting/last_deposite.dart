import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class LastDepositeScreen extends StatefulWidget {
  const LastDepositeScreen({Key? key}) : super(key: key);

  @override
  State<LastDepositeScreen> createState() => _LastDepositeScreenState();
}

class _LastDepositeScreenState extends State<LastDepositeScreen> {
  late TextEditingController _searchtextcontroller;

  @override
  void initState() {
    _searchtextcontroller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _searchtextcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: AnimatedBottomBar(),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          CustomTopBar(topbartitle: 'Last Deposite'),
          CustomBriefCard(
            title_v1: "Amount",
            subtitle_v1: "Rs. 16,240,000",
            icon_v1: Icons.amp_stories_rounded,
            color_v1: Color(0XFFF6921E),
            title_v2: "Date : 10-05-2021",
          ),
          CustomSearchBar(searchtextcontroller: _searchtextcontroller),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              CustomTabBar(
                tab_length: 4,
                tabs: ["D", "W", "M", "Y"],
                child: [
                  ShowUpAnimation(
                    delayStart: Duration(milliseconds: 0),
                    animationDuration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    direction: Direction.horizontal,
                    offset: 0.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return CapitalPaymentHistoryCard(
                          icon: CircleAvatar(
                              radius: 40,
                              backgroundColor: Color(0xFF92298D),
                              child: Icon(Icons.add)),
                          paid_amount: "Rs. 1,20,38,954",
                          pay_date: "Apr 04-2022",
                          closing_amount: "Rs. 12,650,034",
                          closing: "Closing balance",
                        );
                      }),
                    ),
                  ),
                  ShowUpAnimation(
                    delayStart: Duration(milliseconds: 0),
                    animationDuration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    direction: Direction.horizontal,
                    offset: 0.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 14,
                      itemBuilder: ((context, index) {
                        return CapitalPaymentHistoryCard(
                          icon: CircleAvatar(
                              radius: 40,
                              backgroundColor: Color(0xFF92298D),
                              child: Icon(Icons.add)),
                          paid_amount: "Rs. 1,20,38,954",
                          pay_date: "Apr 04-2022",
                          closing_amount: "Rs. 12,650,034",
                          closing: "Closing balance",
                        );
                      }),
                    ),
                  ),
                  ShowUpAnimation(
                    delayStart: Duration(milliseconds: 0),
                    animationDuration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    direction: Direction.horizontal,
                    offset: 0.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: ((context, index) {
                        return CapitalPaymentHistoryCard(
                          icon: CircleAvatar(
                              radius: 40,
                              backgroundColor: Color(0xFF92298D),
                              child: Icon(Icons.add)),
                          paid_amount: "Rs. 1,20,38,954",
                          pay_date: "Apr 04-2022",
                          closing_amount: "Rs. 12,650,034",
                          closing: "Closing balance",
                        );
                      }),
                    ),
                  ),
                  ShowUpAnimation(
                    delayStart: Duration(milliseconds: 0),
                    animationDuration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    direction: Direction.horizontal,
                    offset: 0.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 12,
                      itemBuilder: ((context, index) {
                        return CapitalPaymentHistoryCard(
                          icon: CircleAvatar(
                              radius: 40,
                              backgroundColor: Color(0xFF92298D),
                              child: Icon(Icons.add)),
                          paid_amount: "Rs. 1,20,38,954",
                          pay_date: "Apr 04-2022",
                          closing_amount: "Rs. 12,650,034",
                          closing: "Closing balance",
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ShowUpAnimation(
            delayStart: Duration(milliseconds: 0),
            animationDuration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            direction: Direction.horizontal,
            offset: 0.7,
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return CapitalPaymentHistoryCard(
                    icon: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xFF92298D),
                        child: Icon(Icons.add)),
                    paid_amount: "Rs. 1,20,38,954",
                    pay_date: "Apr 04-2022",
                    closing_amount: "Rs. 12,650,034",
                    closing: "Closing balance",
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
