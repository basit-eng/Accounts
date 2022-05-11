import 'package:flutter/material.dart';
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
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFF90278E),
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
                        SettingList(
                          labelText: 'Touch ID',
                        ),
                        SettingList(
                          labelText: 'Dashboard',
                        ),
                        SettingList(
                          labelText: 'Glow',
                        ),
                        SettingList(
                          labelText: 'Apearance',
                        ),
                        SettingList(
                          labelText: 'Motion',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingList extends StatelessWidget {
  const SettingList({
    Key? key,
    required this.labelText,
    this.details,
    this.trailinig,
  }) : super(key: key);
  final String labelText;
  final String? details;
  final Widget? trailinig;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            labelText,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Color(0xFF606060),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_sharp,
            size: 17,
          ),
        ),
      ),
    );
  }
}
