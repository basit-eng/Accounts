import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({Key? key}) : super(key: key);

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  late TextEditingController _userIdtextcontroller;
  late TextEditingController _userNametextcontroller;
  late TextEditingController _fatherNamecontroller;
  late TextEditingController _cnintextcontroller;
  late TextEditingController _emailtextcontroller;
  late TextEditingController _mobileNotextcontroller;
  late TextEditingController _addresstextcontroller;
  late TextEditingController _nextOfKintextcontroller;
  late TextEditingController _nextOfKinCnictextcontroller;
  late TextEditingController _nextOfKinMobileNotextcontroller;
  late TextEditingController _relationWithNextOfKintextcontroller;

  @override
  void initState() {
    _userIdtextcontroller = TextEditingController();
    _userNametextcontroller = TextEditingController();

    _fatherNamecontroller = TextEditingController();
    _cnintextcontroller = TextEditingController();
    _emailtextcontroller = TextEditingController();
    _mobileNotextcontroller = TextEditingController();
    _addresstextcontroller = TextEditingController();
    _nextOfKintextcontroller = TextEditingController();
    _nextOfKinCnictextcontroller = TextEditingController();
    _nextOfKinMobileNotextcontroller = TextEditingController();
    _relationWithNextOfKintextcontroller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: AnimatedBottomBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Settings',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ProfileListTile(
                          labelText: Text(
                            "User ID",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Color(0xFFF15B28),
                                    fontWeight: FontWeight.w400),
                          ),
                          textField: CustomSimpleImputField(
                            textcontroller: _userIdtextcontroller.text,
                            isfieldCircle: false,
                            hint: "User Id",
                            keyboardtype: TextInputType.number,
                          ),
                        ),
                        ProfileListTile(
                          labelText: Text(
                            "User Name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Color(0xFFF15B28),
                                    fontWeight: FontWeight.w400),
                          ),
                          textField: CustomSimpleImputField(
                            textcontroller: _userIdtextcontroller.text,
                            isfieldCircle: false,
                            hint: "User Name",
                            keyboardtype: TextInputType.number,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
