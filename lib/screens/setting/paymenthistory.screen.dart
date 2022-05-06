import 'package:flutter/material.dart';
import 'package:theaccounts/screens/setting/custom_setting.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            CustomTopBar(bartitle: "Payment History"),
          ],
        ),
      ),
    );
  }
}
