import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/custom_setting.dart';

class CapitalHistory extends StatefulWidget {
  const CapitalHistory({Key? key}) : super(key: key);

  @override
  State<CapitalHistory> createState() => _CapitalHistoryState();
}

class _CapitalHistoryState extends State<CapitalHistory> {
  int selected = 0;

  Widget CustomRadioButton(String title, int index) {
    return Container(
      decoration: BoxDecoration(
        color: (selected == index)
            ? Theme.of(context).cardColor
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            selected = index;
          });
        },
        child: Text('$title',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w400)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              CustomTopBar(bartitle: 'Capital History'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomShortHistory(),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.center,
                          // width: size.width * 0.8,
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
                        width: 04,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: size.height * 0.06,
                          // width: size.width * 0.2,
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
      ),
    );
  }
}

class CustomShortHistory extends StatelessWidget {
  const CustomShortHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.18,
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
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
            title: 'Total Debit',
            subtitle: 'Rs. 160,090.83',
            color: Color.fromARGB(255, 244, 103, 60),
            icon: Icons.arrow_upward,
          ),
          ListtileWidget(
            title: 'Total Debit',
            subtitle: 'Rs. 270,834.03',
            color: Color.fromARGB(255, 168, 19, 171),
            icon: Icons.arrow_downward_outlined,
          ),
        ],
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
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text('$title', style: Theme.of(context).textTheme.bodyText1),
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
        style: Theme.of(context).textTheme.bodyText2,
      ),
      subtitle: Text(
        '$subtitle',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 18,
            ),
      ),
    );
  }
}
