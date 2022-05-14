import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
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
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          // SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomTopBar(topbartitle: 'Recieved Amount'),
          ),
          Container(
            height: size.height / 17,
            width: size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Since',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12, color: Color(0xff606060)),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    blurStyle: BlurStyle.inner,
                                    blurRadius: 3,
                                    spreadRadius: 3,
                                    offset: Offset(2, 4))
                              ]),
                          child: SmallRadiusButton(
                            text: "05-10-2021",
                            color: [
                              Colors.grey.withOpacity(1),
                              Colors.grey.withOpacity(1)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              CustomTabBar(
                tab_length: 3,
                tabs: ["6M", "Y", "ALL"],
                child: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: ((context, index) {
                      return CustomSingleTile(
                        title: "Total recieved",
                        subtitle: "254,000,000",
                        leading: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.purple,
                            child: Image.asset("assets/images/coinsl.png")),
                      );
                    }),
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
                      itemCount: 20,
                      itemBuilder: ((context, index) {
                        return CustomSingleTile(
                          title: "Total recieved",
                          subtitle: "254,000,000",
                          leading: CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.purple,
                              child: Image.asset("assets/images/coinsl.png")),
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
                      itemCount: 20,
                      itemBuilder: ((context, index) {
                        return CustomSingleTile(
                          title: "Total recieved",
                          subtitle: "254,000,000",
                          leading: CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.purple,
                              child: Image.asset("assets/images/coin.png")),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
