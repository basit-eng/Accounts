import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({Key? key}) : super(key: key);

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
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
                          labelText: 'Touch ID',
                        ),
                        ProfileListTile(
                          labelText: 'Dashboard',
                        ),
                        ProfileListTile(
                          labelText: 'Glow',
                        ),
                        ProfileListTile(
                          labelText: 'Apearance',
                        ),
                        ProfileListTile(
                          labelText: 'Motion',
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

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.labelText,
  }) : super(key: key);
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      style:
          NeumorphicStyle(border: NeumorphicBorder.none(), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
          title: Text(
            '$labelText',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
