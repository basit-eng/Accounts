import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class ReferenceInScreen extends StatefulWidget {
  const ReferenceInScreen({Key? key}) : super(key: key);

  @override
  State<ReferenceInScreen> createState() => _ReferenceInScreenState();
}

class _ReferenceInScreenState extends State<ReferenceInScreen> {
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
            CustomTopBar(topbartitle: 'Reference In'),
            CustomBriefCard(
              title_v1: "Total Roll Over",
              subtitle_v1: "16,240,000",
              icon_v1: Icons.amp_stories_rounded,
              color_v1: Color(0XFFF6921E),
              title_v2: "Total History",
              subtitle_v2: "26,240,000",
              icon_v2: Icons.arrow_downward,
              color_v2: Color(0xFF92298D),
            ),
            CustomSearchBar(searchtextcontroller: _searchtextcontroller),
            SingleChildScrollView(
              child: CustomTabBar(
                tab_length: 4,
                tabs: ["D", "W", "M", "Y"],
                child: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: ((context, index) {
                        return CustomReferenceInCard(
                          name: "Khurram Shahzad",
                          token_no: "10203",
                          icon: Icons.circle,
                          color:
                              index % 2 == 0 ? Colors.red : Colors.transparent,
                          amount: "Rs : 1,20,93,640",
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: ((context, index) {
                        return CustomReferenceInCard(
                          name: "Khurram Shahzad",
                          token_no: "10203",
                          icon: Icons.circle,
                          color:
                              index % 2 == 0 ? Colors.red : Colors.transparent,
                          amount: "Rs : 1,20,93,640",
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: ((context, index) {
                        return CustomReferenceInCard(
                          name: "Khurram Shahzad",
                          token_no: "10203",
                          icon: Icons.circle,
                          color:
                              index % 2 == 0 ? Colors.red : Colors.transparent,
                          amount: "Rs : 1,20,93,640",
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: ((context, index) {
                        return CustomReferenceInCard(
                          name: "Khurram Shahzad",
                          token_no: "10203",
                          icon: Icons.circle,
                          color:
                              index % 2 == 0 ? Colors.red : Colors.transparent,
                          amount: "Rs : 1,20,93,640",
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
