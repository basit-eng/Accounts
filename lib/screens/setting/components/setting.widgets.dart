import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:theaccounts/ScopedModelWrapper.dart';
import 'package:theaccounts/utils/shared_pref.dart';

class CustomShortHistory extends StatelessWidget {
  const CustomShortHistory({
    this.leading,
    this.subtitle,
    this.title,
    this.title_t2,
    this.subtitle_t2,
    this.leading_t2,
    this.trailing,
    Key? key,
  }) : super(key: key);

  final Widget? leading;
  final String? title;
  final String? subtitle;
  final Widget? leading_t2;
  final String? title_t2;
  final String? subtitle_t2;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
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
            ListTile(
              leading: SizedBox(
                height: 45,
                width: 45,
                child: leading ??
                    CircleAvatar(
                      backgroundColor: Color(0xFFF6921E),
                      // backgroundImage: AssetImage("assets/images/user.png"),
                    ),
              ),
              title: Text(
                title ?? "",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              subtitle: Text(subtitle ?? "",
                  style: Theme.of(context).textTheme.subtitle2),
            ),
            ListTile(
              leading: SizedBox(
                height: 45,
                width: 45,
                child: leading_t2 ??
                    CircleAvatar(backgroundColor: Colors.transparent

                        // backgroundImage: AssetImage("assets/images/user.png"),
                        ),
              ),
              title: Text(title_t2 ?? "",
                  style: Theme.of(context).textTheme.bodyText2),
              subtitle: Text(subtitle_t2 ?? "",
                  style: Theme.of(context).textTheme.subtitle2),
              trailing: Container(
                height: size.height * 0.3,
                width: size.width * 0.3,
                child: trailing ?? Container(),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Closing month",
                //       style: Theme.of(context).textTheme.bodyText2,
                //     ),
                //     Text(
                //       "Aprail 2022",
                //       style: Theme.of(context).textTheme.bodyText2,
                //     ),
                //   ],
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSingleTile extends StatelessWidget {
  const CustomSingleTile({
    this.leading,
    this.subtitle,
    this.title,
    this.trailing,
    Key? key,
  }) : super(key: key);

  final Widget? leading;
  final String? title;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: size.height * 0.1,
        width: size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
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
            ListTile(
              leading: SizedBox(
                height: 40,
                width: 40,
                child: leading ??
                    CircleAvatar(
                      backgroundColor: Color(0xFF92298D),
                    ),
              ),
              title: Text(
                title ?? "",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle: Text(subtitle ?? "",
                  style: Theme.of(context).textTheme.bodyText2!),
              trailing: trailing,
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      width: size.width,
      child: FutureBuilder<bool>(
        future: SessionData().isDarkTheme(),
        builder: (context, snapshot) {
          bool? darkTheme = snapshot.hasData ? snapshot.data : false;

          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Switch(
                onChanged: (isEnabled) {
                  SessionData().setDarkTheme(isEnabled).then(
                        (value) => setState(() {
                          darkTheme = isEnabled;
                          AppModel model = ScopedModel.of(context);
                          model.seThemeMode(isEnabled);
                        }),
                      );
                },
                value: darkTheme ?? false,
                activeColor: Theme.of(context).primaryColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.labelText,
    this.details,
  }) : super(key: key);
  final String labelText;
  final String? details;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      style: NeumorphicStyle(
          border: NeumorphicBorder.none(), color: Theme.of(context).cardColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
          title: Text(
            '$labelText',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Color(0xFFF15B28),
                ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              details ?? "",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
      ),
    );
  }
}

// class CustomTabBar extends StatefulWidget {
//   const CustomTabBar({Key? key}) : super(key: key);

//   @override
//   State<CustomTabBar> createState() => _CustomTabBarState();
// }

// class _CustomTabBarState extends State<CustomTabBar>
//     with TickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: _tabs.length, vsync: this);
//     _tabController.animateTo(2);
//   }

//   static const List<Tab> _tabs = [
//     const Tab(icon: Icon(Icons.looks_one), child: const Text('D')),
//     const Tab(icon: Icon(Icons.looks_two), text: 'W'),
//     const Tab(icon: Icon(Icons.looks_3), text: 'M'),
//     const Tab(icon: Icon(Icons.looks_3), text: 'Y'),
//   ];

//   static const List<Widget> _views = [
//     const Center(child: const Text('Content of Tab One')),
//     const Center(child: const Text('Content of Tab Two')),
//     const Center(child: const Text('Content of Tab Three')),
//     const Center(child: const Text('Content of Tab Four')),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: TabBar(
//         labelColor: Colors.blue,
//         unselectedLabelColor: Colors.grey,
//         labelStyle: const TextStyle(fontWeight: FontWeight.bold),
//         indicatorWeight: 3,
//         indicatorColor: Colors.blue,
//         indicatorSize: TabBarIndicatorSize.tab,
//         indicatorPadding: const EdgeInsets.all(10),
//         controller: _tabController,
//         tabs: _tabs,
//       ),
//       body: TabBarView(controller: _tabController, children: _views),
//     );
//   }
// }

class CustomHorizontalListView extends StatefulWidget {
  CustomHorizontalListView({
    required this.title,
    required this.child,
    Key? key,
  }) : super(key: key);

  final String title;

  final Widget child;

  @override
  State<CustomHorizontalListView> createState() =>
      _CustomHorizontalListViewState();
}

class _CustomHorizontalListViewState extends State<CustomHorizontalListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double box = 90;
    return Container(
      height: box + 50,
      width: box + 50,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: box,
            width: box,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    // blurRadius: 2,
                    // blurStyle: BlurStyle.outer,
                    // spreadRadius: 9,
                    // offset: Offset(2, 3),
                    color: Theme.of(context).cardColor,
                  )
                ]),
            alignment: Alignment.center,
            child: widget.child,
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 80,
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.visible,
              softWrap: true,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
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
      child: Text(title, style: Theme.of(context).textTheme.bodyText1),
    );
  }
}

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({
    Key? key,
    required this.topbartitle,
  }) : super(key: key);

  final String topbartitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              topbartitle,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Container(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
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
    );
  }
}

class CustomBriefCard extends StatelessWidget {
  const CustomBriefCard({
    Key? key,
    this.title_v1,
    this.title_v2,
    this.subtitle_v1,
    this.subtitle_v2,
    this.icon_v1,
    this.icon_v2,
    this.color_v1,
    this.color_v2,
    this.trailing_v1,
    this.trailing_v2,
  }) : super(key: key);
  final String? title_v1, subtitle_v1;
  final String? title_v2, subtitle_v2;
  final IconData? icon_v1, icon_v2;
  final Color? color_v1, color_v2;
  final Widget? trailing_v1, trailing_v2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(
              radius: 24,
              backgroundColor: color_v1,
              child: Icon(
                icon_v1,
                color: Colors.white,
              )),
          title: Text(title_v1 ?? "",
              style: Theme.of(context).textTheme.bodyText2),
          subtitle: Text(title_v1 ?? "",
              style: Theme.of(context).textTheme.bodyText1),
          trailing: trailing_v1,
        ),
        ListTile(
          leading: CircleAvatar(
              radius: 24,
              backgroundColor: color_v2,
              child: Icon(
                icon_v2,
                color: Colors.white,
              )),
          subtitle: Text(subtitle_v2 ?? "",
              style: Theme.of(context).textTheme.bodyText1),
          title: Text(title_v2 ?? "",
              style: Theme.of(context).textTheme.bodyText2),
          trailing: trailing_v2,
        )
      ]),
    );
  }
}
//-------------------

class PaymentHistoryCard extends StatelessWidget {
  const PaymentHistoryCard({
    Key? key,
    this.amount,
    required this.imagePath,
    this.color,
    this.type,
    this.date,
  }) : super(key: key);
  final String? amount;
  final String? type;

  final String? date;

  final String imagePath;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 45,
            foregroundImage: AssetImage(imagePath),
          ),
          Text(amount ?? "", style: Theme.of(context).textTheme.subtitle1),
          Text(type ?? "", style: Theme.of(context).textTheme.bodyText2),
          Text(date ?? "", style: Theme.of(context).textTheme.bodyText2),
        ],
      ),
    );
  }
}

//-------------------------------capital History

class CapitalPaymentHistoryCard extends StatelessWidget {
  const CapitalPaymentHistoryCard({
    Key? key,
    this.closing_amount,
    this.paid_amount,
    this.pay_date,
    this.icon,
    this.color,
    this.type,
    this.closing,
  }) : super(key: key);
  final String? paid_amount, closing_amount;
  final String? type;

  final String? pay_date, closing;

  final Widget? icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: size.height * 0.1,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.1),
                spreadRadius: 0.2,
                blurRadius: 1,
                blurStyle: BlurStyle.outer),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: icon,
              ),
              SizedBox(
                width: 18,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(paid_amount ?? "",
                      style: Theme.of(context).textTheme.subtitle1),
                  Text(pay_date ?? "",
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
              Spacer(),
              Text(type ?? "", style: Theme.of(context).textTheme.bodyText2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(closing_amount ?? "",
                      style: Theme.of(context).textTheme.subtitle1),
                  Text(closing ?? "",
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//---------------------

//-------------------Reference in tile custom widget

class CustomReferenceInCard extends StatelessWidget {
  const CustomReferenceInCard(
      {Key? key, this.name, this.token_no, this.icon, this.color, this.amount})
      : super(key: key);
  final String? name, token_no, amount;
  final Color? color;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 8,
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name ?? "", style: Theme.of(context).textTheme.subtitle1),
              Text(token_no ?? "",
                  style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(amount ?? "", style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
        ],
      ),
    );
  }
}
//---------------------

class SmallRadiusButton extends StatelessWidget {
  const SmallRadiusButton({
    required this.text,
    this.color,
    Key? key,
  }) : super(key: key);

  final String text;
  final List<Color>? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 00),
      height: 30,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: color ??
              [
                // Color.fromARGB(255, 50, 167, 230),
                // Color.fromARGB(255, 194, 44, 231),
              ],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
