import 'package:flutter/material.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);
  static const routeName = '/update-screen';
  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
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
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Container(
                child: CustomTopBar(topbartitle: "Update Profile"),
              ),
              ProfileListTile(
                labelText: customlableText(context: context, lable: "User ID"),
                textField: CustomSimpleImputField(
                  textcontroller: _userIdtextcontroller.text,
                  isfieldCircle: false,
                  hint: "10092",
                  keyboardtype: TextInputType.number,
                ),
              ),
              ProfileListTile(
                labelText:
                    customlableText(context: context, lable: "User Name"),
                textField: CustomSimpleImputField(
                  textcontroller: _userIdtextcontroller.text,
                  isfieldCircle: false,
                  hint: "Khurram Shahzad",
                  keyboardtype: TextInputType.text,
                ),
              ),
              ProfileListTile(
                labelText:
                    customlableText(context: context, lable: "Father Name"),
                textField: CustomSimpleImputField(
                  textcontroller: _userIdtextcontroller.text,
                  isfieldCircle: false,
                  hint: "Muhammad Ismail",
                  keyboardtype: TextInputType.text,
                ),
              ),
              ProfileListTile(
                labelText: customlableText(context: context, lable: "CNIC"),
                textField: CustomSimpleImputField(
                  textcontroller: _userIdtextcontroller.text,
                  isfieldCircle: false,
                  hint: "6101-172538-8",
                  keyboardtype: TextInputType.number,
                ),
              ),
              ProfileListTile(
                labelText: customlableText(context: context, lable: "Email ID"),
                textField: CustomSimpleImputField(
                  textcontroller: _userIdtextcontroller.text,
                  isfieldCircle: false,
                  hint: "minad_hand@yahoo.com",
                  keyboardtype: TextInputType.emailAddress,
                ),
              ),
              ProfileListTile(
                labelText: customlableText(context: context, lable: "Mobile"),
                textField: CustomSimpleImputField(
                  textcontroller: _userIdtextcontroller.text,
                  isfieldCircle: false,
                  hint: "03215166978",
                  keyboardtype: TextInputType.phone,
                ),
              ),
              ProfileListTile(
                labelText: customlableText(context: context, lable: "Address"),
                textField: CustomSimpleImputField(
                  textcontroller: _userIdtextcontroller.text,
                  isfieldCircle: false,
                  hint: "H# 237, st. 5, F-15/2",
                  keyboardtype: TextInputType.multiline,
                ),
              ),
              ProfileListTile(
                labelText:
                    customlableText(context: context, lable: "Next of Kin"),
                textField: CustomSimpleImputField(
                  textcontroller: _userIdtextcontroller.text,
                  isfieldCircle: false,
                  hint: "Mrs.Khurram",
                  keyboardtype: TextInputType.text,
                ),
              ),
              ProfileListTile(
                labelText: customlableText(
                    context: context, lable: "Next of Kin CNIC"),
                textField: CustomSimpleImputField(
                  textcontroller: _userIdtextcontroller.text,
                  isfieldCircle: false,
                  hint: "76012-2372832-8",
                  keyboardtype: TextInputType.number,
                ),
              ),
              ProfileListTile(
                labelText: customlableText(
                    context: context, lable: "Next of Kin Contact Number"),
                textField: CustomSimpleImputField(
                  textcontroller: _userIdtextcontroller.text,
                  isfieldCircle: false,
                  hint: "0331-5389564",
                  keyboardtype: TextInputType.number,
                ),
              ),
              ProfileListTile(
                labelText: customlableText(
                    context: context, lable: "Relation with Next of kin"),
                textField: CustomSimpleImputField(
                  textcontroller: _userIdtextcontroller.text,
                  isfieldCircle: false,
                  hint: "Wife",
                  keyboardtype: TextInputType.text,
                ),
                trailinig: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    "assets/images/edit.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              AnimatedLongButton(
                text: "Send",
                isBgColorWhite: false,
                width: MediaQuery.of(context).size.width * 0.9,
                color: [
                  Color(0xFFFF708C),
                  Color(0xFFF2E07D),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
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
}
