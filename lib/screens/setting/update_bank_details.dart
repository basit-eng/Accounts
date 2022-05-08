import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/setting.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class UpdateBankDetails extends StatefulWidget {
  const UpdateBankDetails({Key? key}) : super(key: key);
  static const routeName = '/profile-screen';

  @override
  State<UpdateBankDetails> createState() => _UpdateBankDetailsState();
}

class _UpdateBankDetailsState extends State<UpdateBankDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: AnimatedBottomBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                CustomTopBar(topbartitle: "Update Bank Detail"),
                Column(
                  children: [
                    ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ProfileListTile(
                          labelText: 'Bank Name',
                          details: 'Askeri Bank',
                        ),
                        ProfileListTile(
                          labelText: 'Account Title',
                          details: 'Khurram Shazad',
                        ),
                        ProfileListTile(
                          labelText: 'Accont No',
                          details: '187683263868768',
                        ),
                        ProfileListTile(
                          labelText: 'IBAN No.',
                          details: 'ASKIq 031659784641152',
                        ),
                        ProfileListTile(
                          labelText: 'Branch Code',
                          details: '14868',
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
