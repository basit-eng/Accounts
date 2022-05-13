import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class CapitalHistory extends StatefulWidget {
  const CapitalHistory({Key? key}) : super(key: key);

  @override
  State<CapitalHistory> createState() => _CapitalHistoryState();
}

class _CapitalHistoryState extends State<CapitalHistory> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          bottomNavigationBar: AnimatedBottomBar(),
          body: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Capital History",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 24,
                          color: Color.fromARGB(255, 168, 19, 171),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CustomBriefCard(
                title_v1: "Total Debit",
                subtitle_v1: "Rs. 16,240,000",
                icon_v1: Icons.arrow_upward,
                color_v1: Color(0XFFF6921E),
                title_v2: "Total History",
                subtitle_v2: "Rs. 26,240,000",
                icon_v2: Icons.arrow_downward,
                color_v2: Color(0xFF92298D),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: CustomTabBar(
                  tab_length: 4,
                  tabs: ["D", "W", "M", "Y"],
                  child: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: ((context, index) {
                        return CapitalPaymentHistoryCard(
                          icon: CircleAvatar(
                              radius: 24,
                              backgroundColor: Color(0xFF92298D),
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                              )),
                          paid_amount: "Rs. 1,20,38,954",
                          pay_date: "Apr 04-2022",
                          closing_amount: "Rs. 12,650,034",
                          closing: "Closing balance",
                        );
                      }),
                    ),
                    ListView.builder(
                      itemCount: 20,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return CapitalPaymentHistoryCard(
                          icon: CircleAvatar(
                              radius: 24,
                              backgroundColor: Color(0xFF92298D),
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                              )),
                          paid_amount: "Rs. 1,20,38,954",
                          pay_date: "Apr 04-2022",
                          closing_amount: "Rs. 12,650,034",
                          closing: "Closing balance",
                        );
                      }),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: ((context, index) {
                        return CapitalPaymentHistoryCard(
                          icon: CircleAvatar(
                              radius: 24,
                              backgroundColor: Color(0xFF92298D),
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                              )),
                          paid_amount: "Rs. 1,20,38,954",
                          pay_date: "Apr 04-2022",
                          closing_amount: "Rs. 12,650,034",
                          closing: "Closing balance",
                        );
                      }),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: ((context, index) {
                        return CapitalPaymentHistoryCard(
                          icon: CircleAvatar(
                              radius: 24,
                              backgroundColor: Color(0xFF92298D),
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                              )),
                          paid_amount: "Rs. 1,20,38,954",
                          pay_date: "Apr 04-2022",
                          closing_amount: "Rs. 12,650,034",
                          closing: "Closing balance",
                        );
                      }),
                    ),
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
