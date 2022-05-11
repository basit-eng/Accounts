import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:theaccounts/screens/setting/capital_history.dart';
import 'package:theaccounts/screens/dashboard/dashboard.screens/closingPayment.dart';
import 'package:theaccounts/screens/setting/profile_screen.dart';
import 'package:theaccounts/screens/setting/update_bank_details.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 55,
            width: 330,
            margin: EdgeInsets.symmetric(horizontal: 13),
            child: Neumorphic(
              child: Center(
                  child: Text(
                widget.title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 19.72,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF404041),
                    ),
                // style: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black54),
              )),
              style: NeumorphicStyle(
                border: NeumorphicBorder(
                  color: Color(0xFFF3F3F3),
                ),
                shape: NeumorphicShape.flat,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
                lightSource: LightSource.topLeft,
                intensity: 1.0,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomGridview extends StatelessWidget {
  const CustomGridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 30,
      crossAxisCount: 3,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CapitalHistory(),
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4,
                      spreadRadius: 3,
                      blurStyle: BlurStyle.outer)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/capital.png',
                  height: 40,
                  width: 40,
                ),
                SizedBox(
                  height: 05,
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    "Capital History",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.6),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ClosingPaymentScreen(),
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4,
                      spreadRadius: 3,
                      blurStyle: BlurStyle.outer)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/closingpayment.png',
                  height: 40,
                  width: 40,
                ),
                SizedBox(
                  height: 05,
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    "Closing Payment History",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.6),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4,
                    spreadRadius: 3,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/recieved.png',
                height: 40,
                width: 40,
              ),
              SizedBox(
                height: 05,
              ),
              SizedBox(
                width: 90,
                child: Text(
                  "Recieved Amount",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6),
                      ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 3,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/paymentclose.png',
                height: 40,
                width: 40,
              ),
              SizedBox(
                height: 05,
              ),
              SizedBox(
                width: 90,
                child: Text(
                  "Closing Payment",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6),
                      ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 3,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/monthlyratio.png',
                height: 40,
                width: 40,
              ),
              SizedBox(
                height: 05,
              ),
              SizedBox(
                width: 90,
                child: Text(
                  "BiMonthly Ratio",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6),
                      ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 3,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/referencein.png',
                height: 40,
                width: 40,
              ),
              SizedBox(
                height: 05,
              ),
              SizedBox(
                width: 90,
                child: Text(
                  "Reference In",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6),
                      ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4,
                      spreadRadius: 3,
                      blurStyle: BlurStyle.outer)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/updateprofile.png',
                  height: 40,
                  width: 40,
                ),
                SizedBox(
                  height: 05,
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    "Update Profile",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.6),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateBankDetails(),
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4,
                      spreadRadius: 3,
                      blurStyle: BlurStyle.outer)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bankuupdate.png',
                  height: 40,
                  width: 40,
                ),
                SizedBox(
                  height: 05,
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    "Update Bank Details",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.6),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 3,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/lstDeposit.png',
                height: 40,
                width: 40,
              ),
              SizedBox(
                height: 05,
              ),
              SizedBox(
                width: 90,
                child: Text(
                  "Last Deposit",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6),
                      ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 3,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/personalprofile.png',
                height: 40,
                width: 40,
              ),
              SizedBox(
                height: 05,
              ),
              SizedBox(
                width: 90,
                child: Text(
                  "View Personal Profile",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6),
                      ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 3,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/imagegalery.png',
                height: 40,
                width: 40,
              ),
              SizedBox(
                height: 05,
              ),
              SizedBox(
                width: 90,
                child: Text(
                  "Image Gallery",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6),
                      ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 3,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/password.png',
                height: 40,
                width: 40,
              ),
              SizedBox(
                height: 05,
              ),
              SizedBox(
                width: 90,
                child: Text(
                  " Password ",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6),
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
