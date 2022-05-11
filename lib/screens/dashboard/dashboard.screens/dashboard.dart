import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/bimonthly_ratio.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/closingPayment.dart';
import 'package:theaccounts/screens/setting/profile_screen.dart';
import 'package:theaccounts/screens/setting/update_bank_details.dart';
import 'package:theaccounts/screens/setting/update_profile.dart';
import 'package:theaccounts/screens/setting/capital_history.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';
import 'package:theaccounts/screens/setting/image_galleryscreen.dart';
import 'package:theaccounts/screens/setting/last_deposite.dart';
import 'package:theaccounts/screens/setting/payment_history.dart';
import 'package:theaccounts/screens/setting/recieved_amount.dart';
import 'package:theaccounts/screens/setting/referenceIn_screen.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key? key}) : super(key: key);
  static const routeName = '/Dashboard-screen';

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<String> grid_menu_name = [
    "Capital History",
    "Capital Payment History",
    "Received Amount",
    "Closing Payment",
    "Bi Monthly Payment",
    "Reference In",
    "Update Profile",
    "Update Bank detail",
    "Last amount added",
    "View Persnal Profile ",
    "Image Gallery",
    "Password"
  ];

  List<String> grid_menu_icons = [
    "assets/images/capital.png",
    "assets/images/paymentclose.png",
    "assets/images/recieved.png",
    "assets/images/paymentclose.png",
    "assets/images/monthlyratio.png",
    "assets/images/referencein.png",
    "assets/images/updateprofile.png",
    "assets/images/bankuupdate.png",
    "assets/images/lstDeposit.png",
    "assets/images/personalprofile.png",
    "assets/images/imagegalery.png",
    "assets/images/password.png",
  ];
  List<Widget> views = [
    CapitalHistory(),
    PaymentHistory(),
    RecievedAmount(),
    ClosingPaymentScreen(),
    BimonthlyRatioScreen(),
    ReferenceInScreen(),
    UpdateProfile(),
    UpdateBankDetails(),
    LastDepositeScreen(),
    ProfileScreen(),
    ImageGalleryScreen(),
    CapitalHistory(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: AnimatedBottomBar(),
        body: Container(
          alignment: Alignment.center,
          height: size.height,
          width: size.width,
          child: dashboardbody(context),
        ),
      ),
    );
  }

  Widget dashboardbody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTopBar(topbartitle: 'Dashboard'),
        ),

        SizedBox(
          height: 10,
        ),
        Flexible(
          flex: 03,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(28),
              ),
              alignment: Alignment.center,
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 100,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => views[index],
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .shadowColor
                                      .withOpacity(0.9),
                                  blurRadius: 0.7,
                                  spreadRadius: 0.8,
                                  // offset: Offset(0.2, 0.3),
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              grid_menu_icons[index],
                              height: 25,
                              width: 25,
                              fit: BoxFit.contain,
                              // color: Color.fromARGB(255, 107, 4, 91),
                            ),
                            SizedBox(
                              height: 05,
                            ),
                            SizedBox(
                              width: 70,
                              child: Text(grid_menu_name[index],
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.visible,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontWeight: FontWeight.w400)),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
        // Spacer(),
      ],
    );
  }
}
