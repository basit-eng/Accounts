import 'package:flutter/material.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class BiMonthlyScreen extends StatefulWidget {
  const BiMonthlyScreen({Key? key}) : super(key: key);

  @override
  State<BiMonthlyScreen> createState() => _BiMonthlyScreenState();
}

class _BiMonthlyScreenState extends State<BiMonthlyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTopBar(topbartitle: "Bi Monthly Ratio"),
          AnimatedCircularBar(title: "11,000"),
          Text("18 02 2022"),
        ],
      ),
    );
  }
}
