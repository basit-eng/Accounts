import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/setting.dart';

class UpdateBankDetails extends StatefulWidget {
  const UpdateBankDetails({Key? key}) : super(key: key);
  static const routeName = '/profile-screen';

  @override
  State<UpdateBankDetails> createState() => _UpdateBankDetailsState();
}

class _UpdateBankDetailsState extends State<UpdateBankDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 231, 231, 234),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Update Bank Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingScreen(),
                            ),
                          );
                        },
                        child: Icon(Icons.arrow_back_rounded,
                            size: 25, color: Colors.black54),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  ListView(
                    scrollDirection: Axis.vertical,
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
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.labelText,
    required this.details,
  }) : super(key: key);
  final String labelText, details;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      style:
          NeumorphicStyle(border: NeumorphicBorder.none(), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
          title: Text(
            '$labelText',
            style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 231, 121, 36),
                fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              '$details',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
