import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class LastDepositeScreen extends StatefulWidget {
  const LastDepositeScreen({Key? key}) : super(key: key);

  @override
  State<LastDepositeScreen> createState() => _LastDepositeScreenState();
}

class _LastDepositeScreenState extends State<LastDepositeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTopBar(topbartitle: 'Last Deposite'),
            ),
            CustomBriefCard(
              title_v1: "Amount",
              subtitle_v1: "16,240,000",
              icon_v1: Icons.amp_stories_rounded,
              color_v1: Color(0XFFF6921E),
              title_v2: "Date : 10-05-2021",
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return CapitalPaymentHistoryCard(
                    icon: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xFF92298D),
                        child: Icon(Icons.add)),
                    paid_amount: "1,20,38,954",
                    pay_date: "Apr 04-2022",
                    closing_amount: "12,650,034",
                    closing: "Closing balance",
                  );
                }),
              ),
            ),
            AnimatedBottomBar(),
          ],
        ),
      ),
    );
  }
}
