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
    this.textField,
    this.trailinig,
  }) : super(key: key);
  final Widget? labelText;
  final Widget? textField;
  final Widget? trailinig;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          minVerticalPadding: 10.0,
          title: labelText ??
              Text("Label",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Color(0xFFF15B28))),
          subtitle: textField ??
              Text("Input Field", style: Theme.of(context).textTheme.subtitle1),
          trailing: trailinig,
        ),
      ),
    );
  }
}

class CustomSimpleImputField extends StatefulWidget {
  CustomSimpleImputField(
      {required textcontroller,
      this.icon,
      this.hint,
      this.label,
      this.suffixicon,
      this.keyboardtype,
      required this.isfieldCircle,
      Key? key})
      : super(key: key);

  final TextEditingController textcontroller = TextEditingController();
  final IconData? icon;
  final String? hint, label;
  final Widget? suffixicon;
  final TextInputType? keyboardtype;
  final bool isfieldCircle;

  @override
  State<CustomSimpleImputField> createState() => _CustomSimpleImputFieldState();
}

class _CustomSimpleImputFieldState extends State<CustomSimpleImputField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextField(
      keyboardType: widget.keyboardtype ?? TextInputType.text,
      textAlign: widget.isfieldCircle ? TextAlign.end : TextAlign.start,
      style: TextStyle(
          fontSize: widget.isfieldCircle ? 14 : 16,
          fontWeight: widget.isfieldCircle ? FontWeight.w300 : FontWeight.w400),
      controller: widget.textcontroller,
      decoration: InputDecoration(
        suffixIcon: widget.suffixicon ?? null,
        hintText: widget.hint,
        hintStyle: widget.isfieldCircle
            ? Theme.of(context).textTheme.subtitle1
            : Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Color(0xFF858585), fontWeight: FontWeight.bold),
        // label: Text(
        //   widget.label ?? "",
        //   style: widget.isfieldCircle
        //       ? Theme.of(context).textTheme.subtitle1
        //       : Theme.of(context).textTheme.bodyText1!.copyWith(
        //           color: Color(0xFFF15B28), fontWeight: FontWeight.w400),
        // ),
        // labelStyle: widget.isfieldCircle
        //     ? Theme.of(context).textTheme.subtitle1
        //     : Theme.of(context).textTheme.bodyText1!.copyWith(
        //         color: Color(0xFFF15B28), fontWeight: FontWeight.w400),
        border: InputBorder.none,
      ),
    );
  }
}

class CustomTabBar extends StatefulWidget {
  const CustomTabBar(
      {required this.child,
      required this.tab_length,
      required this.tabs,
      Key? key})
      : super(key: key);
  final List<Widget> child;
  final int tab_length;
  final List<String> tabs;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.tabs.length, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // List _tabs = widget.tabs;
  // ["D", "W", "M", "Y"];

  // List<Widget> _views = [
  //   const Center(child: const Text('Content of Tab One')),
  //   const Center(child: const Text('Content of Tab Two')),
  //   const Center(child: const Text('Content of Tab Three')),
  //   const Center(child: const Text('Content of Tab Four')),
  // ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 09,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.withOpacity(0.3),
                    // color: Theme.of(context).shadowColor.withOpacity(0.8)
                  ),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Theme.of(context).cardColor,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    indicatorColor: Colors.transparent,
                    tabs: [
                      for (int i = 0; i < widget.tabs.length; i++)
                        Container(
                          alignment: Alignment.center,
                          child: Text(widget.tabs[i],
                              style: Theme.of(context).textTheme.bodyText2),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: _selectedIndex == i
                                ? Colors.white
                                : Colors.transparent,
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 02,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 08.0, vertical: 10),
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.068,
                  // width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.3)),
                  child: Image.asset("assets/images/slider.png"),
                ),
              ),
            )
          ],
        ),
        Container(
            height: size.height * 0.9,
            width: double.maxFinite,
            child:
                TabBarView(controller: _tabController, children: widget.child)),
      ],
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    required TextEditingController searchtextcontroller,
  })  : _searchtextcontroller = searchtextcontroller,
        super(key: key);

  final TextEditingController _searchtextcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.2),
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(3, 4),
            ),
          ],
        ),
        child: TextField(
          style: TextStyle(fontSize: 14),
          controller: _searchtextcontroller,
          decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.purple,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w800,
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        height: size.height * 0.18,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(26)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            subtitle: Text(subtitle_v1 ?? "",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w400)),
            trailing: trailing_v1,
          ),
          ListTile(
            leading: CircleAvatar(
                radius: 24,
                backgroundColor: color_v2 ?? Colors.transparent,
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
      ),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
      child: Container(
        height: size.height * 0.1,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: color,
                    radius: 24,
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(imagePath),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(amount ?? "",
                      style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
            ),
            Text(type ?? "", style: Theme.of(context).textTheme.bodyText2),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(date ?? "",
                  style: Theme.of(context).textTheme.bodyText2),
            ),
          ],
        ),
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

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CircleAvatar(
                      backgroundColor: color,
                      radius: 08,
                      child: Icon(
                        icon,
                        color: color ?? null,
                        size: 08,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name ?? "",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        token_no ?? "",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 10, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(amount ?? "",
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//---------------------

class SmallRadiusButton extends StatelessWidget {
  const SmallRadiusButton({
    required this.text,
    this.textcolor,
    this.color,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color? textcolor;
  final List<Color>? color;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 00),
      height: height ?? 30,
      width: width ?? 60,
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
                color: textcolor ?? Colors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
