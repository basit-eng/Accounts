import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class UpdateBankDetails extends StatefulWidget {
  const UpdateBankDetails({Key? key}) : super(key: key);
  static const routeName = '/profile-screen';
  @override
  State<UpdateBankDetails> createState() => _UpdateBankDetailsState();
}

class _UpdateBankDetailsState extends State<UpdateBankDetails> {
  late TextEditingController _branchcodetextcontroller;
  late TextEditingController _bankNametextcontroller;
  late TextEditingController _accounttitlecontroller;
  late TextEditingController _accountNocontroller;
  late TextEditingController _IBANnocontroller;
  @override
  void initState() {
    _bankNametextcontroller = TextEditingController();
    _accounttitlecontroller = TextEditingController();
    _IBANnocontroller = TextEditingController();
    _accountNocontroller = TextEditingController();
    _branchcodetextcontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: AnimatedBottomBar(),
        body: Column(
          children: [
            Expanded(
                flex: 01,
                child: CustomTopBar(topbartitle: "Update Bank Detail")),
            Expanded(
              flex: 09,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ProfileListTile(
                      labelText:
                          customlableText(context: context, lable: "Bank Name"),
                      textField: CustomSimpleImputField(
                        textcontroller: _bankNametextcontroller.text,
                        isfieldCircle: false,
                        hint: "Askari Bank",
                        keyboardtype: TextInputType.emailAddress,
                      ),
                    ),
                    ProfileListTile(
                      labelText: customlableText(
                          context: context, lable: "Account Title"),
                      textField: CustomSimpleImputField(
                        textcontroller: _accounttitlecontroller.text,
                        isfieldCircle: false,
                        hint: "Khurram Shahzad",
                        keyboardtype: TextInputType.phone,
                      ),
                    ),
                    ProfileListTile(
                      labelText: customlableText(
                          context: context, lable: "Account No"),
                      textField: CustomSimpleImputField(
                        textcontroller: _accountNocontroller.text,
                        isfieldCircle: false,
                        hint: "031659784641152",
                        keyboardtype: TextInputType.multiline,
                      ),
                    ),
                    ProfileListTile(
                      labelText:
                          customlableText(context: context, lable: "IBAN No"),
                      textField: CustomSimpleImputField(
                        textcontroller: _IBANnocontroller.text,
                        isfieldCircle: false,
                        hint: "ASKIq 031659784641152",
                        keyboardtype: TextInputType.text,
                      ),
                    ),
                    ProfileListTile(
                      labelText: customlableText(
                          context: context, lable: "Branch Code"),
                      textField: CustomSimpleImputField(
                        textcontroller: _branchcodetextcontroller.text,
                        isfieldCircle: false,
                        hint: "06459",
                        keyboardtype: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            )
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
