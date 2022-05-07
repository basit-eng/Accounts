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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 231, 231, 234),
        body: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTopBar(topbartitle: 'Reference In'),
            ),
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return CustomReferenceInCard(
                    name: "Khurram Shahzad",
                    token_no: "10203",
                    icon: Icons.circle,
                    color: index % 2 == 0 ? Colors.red : Colors.transparent,
                    amount: "Rs : 1,20,93,640",
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
