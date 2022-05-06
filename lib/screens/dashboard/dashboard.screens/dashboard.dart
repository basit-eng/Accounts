import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/capital_history.dart';
import 'package:theaccounts/screens/setting/custom_setting.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key? key}) : super(key: key);
  static const routeName = '/Dashboard-screen';

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: AnimatedBottomBar(),
        body: Container(
          alignment: Alignment.center,
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.passthrough,
            children: [
              Positioned(child: dashboardbody(context)),
            ],
          ),
        ),
      ),
    );
  }

  Column dashboardbody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTopBar(bartitle: 'Dashboard'),
        ),

        SizedBox(
          height: 10,
        ),
        Flexible(
          flex: 03,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.topCenter,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 80,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CapitalHistory(),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).shadowColor,
                                  blurRadius: 04,
                                  spreadRadius: 3,
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/coin.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                              // color: Color.fromARGB(255, 107, 4, 91),
                            ),
                            SizedBox(
                              height: 05,
                            ),
                            SizedBox(
                              width: 70,
                              child: Text("Capital History",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.visible,
                                  style: Theme.of(context).textTheme.bodyText1),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
        // Spacer(),
      ],
    );
  }
}
