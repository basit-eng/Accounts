import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            Expanded(
                flex: 01, child: CustomTopBar(topbartitle: "View Profile")),
            Expanded(
              flex: 09,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  ProfileListTile(
                    labelText:
                        customlableText(context: context, lable: 'User ID'),
                    textField: customsubtitlelableText(
                        context: context, subtitle: '0238789'),
                  ),
                  ProfileListTile(
                    labelText: customlableText(context: context, lable: 'Name'),
                    textField: customsubtitlelableText(
                        context: context, subtitle: 'Khurram Shazad'),
                  ),
                  ProfileListTile(
                    labelText:
                        customlableText(context: context, lable: 'Father Name'),
                    textField: customsubtitlelableText(
                        context: context, subtitle: 'Ismail Shazad'),
                  ),
                  ProfileListTile(
                    labelText: customlableText(context: context, lable: 'CNIC'),
                    textField: customsubtitlelableText(
                        context: context, subtitle: '71501-4678348-0'),
                  ),
                  ProfileListTile(
                      labelText:
                          customlableText(context: context, lable: 'Email ID'),
                      textField: customsubtitlelableText(
                          context: context,
                          subtitle: 'KhurramShazad@gamil.com'),
                      trailinig: trailingIcon()),
                  ProfileListTile(
                      labelText: customlableText(
                        context: context,
                        lable: 'Address',
                      ),
                      textField: customsubtitlelableText(
                        context: context,
                        subtitle: 'H.23, St.23, F-10/Markaz, Islamabad',
                      ),
                      trailinig: trailingIcon()),
                  ProfileListTile(
                      labelText:
                          customlableText(context: context, lable: 'Mobile'),
                      textField: customsubtitlelableText(
                          context: context, subtitle: '03000000000'),
                      trailinig: trailingIcon()),
                  ProfileListTile(
                    labelText:
                        customlableText(context: context, lable: 'Next Of Kin'),
                    textField: customsubtitlelableText(
                        context: context, subtitle: 'Mrs. Shazad'),
                  ),
                  ProfileListTile(
                    labelText: customlableText(
                        context: context, lable: 'Next Of Kin CNIC'),
                    textField: customsubtitlelableText(
                        context: context, subtitle: '71501-4678348-0'),
                    trailinig: trailingIcon(),
                  ),
                  ProfileListTile(
                      labelText: customlableText(
                        context: context,
                        lable: 'Next Of Kin Contact Number',
                      ),
                      textField: customsubtitlelableText(
                          context: context, subtitle: '03000000000'),
                      trailinig: trailingIcon()),
                  ProfileListTile(
                    labelText: customlableText(
                      context: context,
                      lable: 'Relation With Next of Kin',
                    ),
                    textField: customsubtitlelableText(
                        context: context, subtitle: 'Wife'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnimatedLongButton(
                    text: "Send",
                    isBgColorWhite: false,
                    width: MediaQuery.of(context).size.width * 0.95,
                    color: [
                      Color(0xFFFF708C),
                      Color(0xFFF2E07D),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox trailingIcon() {
    return SizedBox(
      width: 24,
      height: 24,
      child: Image.asset(
        "assets/images/edit.png",
        fit: BoxFit.contain,
      ),
    );
  }

  Text customlableText({required BuildContext context, required String lable}) {
    return Text(
      lable,
      style: Theme.of(context)
          .textTheme
          .bodyText2!
          .copyWith(color: Color(0xFFF15B28), fontWeight: FontWeight.w400),
    );
  }

  Text customsubtitlelableText(
      {required BuildContext context, required String subtitle}) {
    return Text(
      subtitle,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Color(0xFF858585), fontWeight: FontWeight.bold),
    );
  }
}
