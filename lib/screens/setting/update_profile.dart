import 'package:flutter/material.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);
  static const routeName = '/update-screen';

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                CustomTopBar(topbartitle: "Update Profile"),
                Column(
                  children: [
                    ListView(
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
      ),
    );
  }
}
