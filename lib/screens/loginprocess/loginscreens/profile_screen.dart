import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/loginprocess/loginscreens/setting.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
                      'View Profile',
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_rounded,
                            size: 25,
                          ),
                        ),
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
                        labelText: 'User ID',
                        details: '0238789',
                      ),
                      ProfileListTile(
                        labelText: 'Name',
                        details: 'Khurram Shazad',
                      ),
                      ProfileListTile(
                        labelText: 'Father Name',
                        details: 'Ismail Shazad',
                      ),
                      ProfileListTile(
                        labelText: 'CNIC',
                        details: '71501-4678348-0',
                      ),
                      ProfileListTile(
                        labelText: 'Email ID',
                        details: 'KhurramShazad@gamil.com',
                      ),
                      ProfileListTile(
                        labelText: 'Mobile',
                        details: '03000000000',
                      ),
                      ProfileListTile(
                        labelText: 'Address',
                        details: 'H.23, St.23, F-10/Markaz, Islamabad',
                      ),
                      ProfileListTile(
                        labelText: 'Next Of Kin',
                        details: 'Mrs. Shazad',
                      ),
                      ProfileListTile(
                        labelText: 'Next Of CNIC',
                        details: '71501-4678348-0',
                      ),
                      ProfileListTile(
                        labelText: 'Next Of Kin Contact Number',
                        details: '03000000000',
                      ),
                      ProfileListTile(
                        labelText: 'Relation With Next of Kin',
                        details: 'Wife',
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
      style: NeumorphicStyle(
          border: NeumorphicBorder.none(), color: Theme.of(context).cardColor),
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
              details,
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
