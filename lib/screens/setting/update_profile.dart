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
        body: Column(
          children: [
            Expanded(
                flex: 01, child: CustomTopBar(topbartitle: "Update Profile")),
            Expanded(
              flex: 09,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    ProfileListTile(
                      labelText:
                          customlableText(context: context, lable: "User ID"),
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
                        keyboardtype: TextInputType.number,
                      ),
                    ),
                    ProfileListTile(
                      labelText: customlableText(
                          context: context, lable: "Father Name"),
                      textField: CustomSimpleImputField(
                        textcontroller: _userIdtextcontroller.text,
                        isfieldCircle: false,
                        hint: "Muhammad Ismail",
                        keyboardtype: TextInputType.number,
                      ),
                    ),
                    ProfileListTile(
                      labelText:
                          customlableText(context: context, lable: "CNIC"),
                      textField: CustomSimpleImputField(
                        textcontroller: _userIdtextcontroller.text,
                        isfieldCircle: false,
                        hint: "6101-172538-8",
                        keyboardtype: TextInputType.number,
                      ),
                    ),
                    ProfileListTile(
                      labelText:
                          customlableText(context: context, lable: "Email ID"),
                      textField: CustomSimpleImputField(
                        textcontroller: _userIdtextcontroller.text,
                        isfieldCircle: false,
                        hint: "minad_hand@yahoo.com",
                        keyboardtype: TextInputType.emailAddress,
                      ),
                    ),
                    ProfileListTile(
                      labelText:
                          customlableText(context: context, lable: "Mobile"),
                      textField: CustomSimpleImputField(
                        textcontroller: _userIdtextcontroller.text,
                        isfieldCircle: false,
                        hint: "03215166978",
                        keyboardtype: TextInputType.phone,
                      ),
                    ),
                    ProfileListTile(
                      labelText:
                          customlableText(context: context, lable: "Address"),
                      textField: CustomSimpleImputField(
                        textcontroller: _userIdtextcontroller.text,
                        isfieldCircle: false,
                        hint: "H# 237, st. 5, F-15/2",
                        keyboardtype: TextInputType.multiline,
                      ),
                    ),
                    ProfileListTile(
                      labelText: customlableText(
                          context: context, lable: "Next of Kin"),
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
                          context: context,
                          lable: "Next of Kin Contact Number"),
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
          ],
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















// Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 00.0, vertical: 08),
//       child: Container(
//         height: size.height / 12,
//         width: size.width,
//         padding: EdgeInsets.symmetric(horizontal: 12),
//         alignment: Alignment.center,
//         margin: EdgeInsets.symmetric(horizontal: 12),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               blurStyle: BlurStyle.outer,
//               blurRadius: 1,
//               spreadRadius: 1,
//               offset: Offset(3, 4),
//             ),
//           ],
//           color: Colors.white,
//         ),
//         child: TextField(
//           keyboardType: widget.keyboardtype ?? TextInputType.text,
//           textAlign: widget.isfieldCircle ? TextAlign.end : TextAlign.start,
//           style: TextStyle(
//               fontSize: widget.isfieldCircle ? 14 : 16,
//               fontWeight:
//                   widget.isfieldCircle ? FontWeight.w300 : FontWeight.w400),
//           controller: widget.textcontroller,
//           decoration: InputDecoration(
//             suffixIcon: widget.suffixicon ?? null,
//             hintText: widget.hint,
//             hintStyle: widget.isfieldCircle
//                 ? Theme.of(context).textTheme.subtitle1
//                 : Theme.of(context).textTheme.bodyText1!.copyWith(
//                     color: Color(0xFF858585), fontWeight: FontWeight.w400),
//             label: Text(
//               widget.label ?? "",
//               style: widget.isfieldCircle
//                   ? Theme.of(context).textTheme.subtitle1
//                   : Theme.of(context).textTheme.bodyText1!.copyWith(
//                       color: Color(0xFFF15B28), fontWeight: FontWeight.w400),
//             ),
//             // labelStyle: widget.isfieldCircle
//             //     ? Theme.of(context).textTheme.subtitle1
//             //     : Theme.of(context).textTheme.bodyText1!.copyWith(
//             //         color: Color(0xFFF15B28), fontWeight: FontWeight.w400),
//             border: InputBorder.none,
//           ),
//         ),
//       ),
//     );
