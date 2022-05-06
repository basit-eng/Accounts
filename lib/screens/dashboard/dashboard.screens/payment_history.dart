import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/custom_setting.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  int selected = 0;

  Widget CustomRadioButton(String title, int index) {
    return Container(
      decoration: BoxDecoration(
        color: (selected == index) ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            selected = index;
          });
        },
        child: Text(
          '$title',
          style: TextStyle(
            color: (selected == index) ? Colors.black54 : Colors.black54,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

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
              child: CustomTopBar(bartitle: 'Payment History'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: size.height * 0.18,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(3, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListtileWidget(
                        title: 'Total RollOver',
                        subtitle: 'Rs. 160,090.83',
                        color: Color.fromARGB(255, 244, 103, 60),
                        icon: Icons.replay),
                    ListtileWidget(
                      title: 'Total Transfer',
                      subtitle: 'Rs. 270,834.03',
                      color: Color.fromARGB(255, 168, 19, 171),
                      icon: Icons.shuffle_outlined,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomRadioButton('D', 1),
                          CustomRadioButton('W', 2),
                          CustomRadioButton('M', 3),
                          CustomRadioButton('Y', 4)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Image(
                              image: AssetImage(
                            'images/adjust.png',
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return CustomListTile(
                    color: Color.fromARGB(255, 244, 103, 60),
                    icon: Icons.arrow_upward,
                    labelText: 'Rs. 130,987.00',
                    details: 'April 4 2022',
                    secondLabel: 'Rs. 120,823.00',
                    secondDetails: 'closing Balance',
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

class calenderWidget extends StatelessWidget {
  const calenderWidget({Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        // color: Color.fromARGB(255, 201, 201, 201),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$title',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ListtileWidget extends StatelessWidget {
  const ListtileWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  }) : super(key: key);
  final String title, subtitle;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: color),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        '$title',
        style: TextStyle(color: Colors.black54, fontSize: 16),
      ),
      subtitle: Text(
        '$subtitle',
        style: TextStyle(
            color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}
