import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
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
            CustomTopBar(topbartitle: 'Payment History'),
            CustomBriefCard(
              title_v1: "Total Roll Over",
              subtitle_v1: "16,240,000",
              icon_v1: Icons.arrow_upward,
              color_v1: Color(0XFFF6921E),
              title_v2: "Total History",
              subtitle_v2: "26,240,000",
              icon_v2: Icons.arrow_downward,
              color_v2: Color(0xFF92298D),
            ),
            SizedBox(
              height: 12,
            ),
            CustomTabBar(
              tab_length: 4,
              tabs: ["D", "W", "M", "Y"],
              child: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return PaymentHistoryCard(
                        amount: "165,203,000",
                        type: "CP",
                        date: "24-07-2021",
                        color: Color(0xFFF6921E),
                        imagePath: "assets/images/coin.png");
                  }),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return PaymentHistoryCard(
                        amount: "165,203,000",
                        type: "CP",
                        date: "24-07-2021",
                        color: Color(0xFFF6921E),
                        imagePath: "assets/images/coin.png");
                  }),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return PaymentHistoryCard(
                        amount: "165,203,000",
                        type: "CP",
                        date: "24-07-2021",
                        color: Color(0xFFF6921E),
                        imagePath: "assets/images/coin.png");
                  }),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return PaymentHistoryCard(
                        amount: "165,203,000",
                        type: "CP",
                        date: "24-07-2021",
                        color: Color(0xFFF6921E),
                        imagePath: "assets/images/coin.png");
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
