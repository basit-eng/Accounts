import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class RecievedAmount extends StatefulWidget {
  const RecievedAmount({Key? key}) : super(key: key);

  @override
  State<RecievedAmount> createState() => _RecievedAmountState();
}

class _RecievedAmountState extends State<RecievedAmount> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 231, 231, 234),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomTopBar(topbartitle: 'Recieved Amount'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  flex: 5,
                  child: SizedBox(
                    width: 10,
                  )),
              Expanded(
                flex: 1,
                child: Text('Since'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Expanded(
                  flex: 1,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      border: NeumorphicBorder.none(),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0x606060),
                      ),
                      child: Text(
                        '20-22-2022',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: ((context, index) {
                return CustomSingleTile(
                  title: "Total recieved",
                  subtitle: "254,000,000",
                  leading: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.purple,
                      child: Image.asset("asset/images/coin.png")),
                );
              }),
            ),
          ),
          AnimatedBottomBar(),
        ],
      ),
    );
  }
}
