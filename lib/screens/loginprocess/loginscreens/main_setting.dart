import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

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
