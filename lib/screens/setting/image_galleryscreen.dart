import 'package:flutter/material.dart';
import 'package:theaccounts/screens/dashboard/custom.widgets/custom.widgets.dart';
import 'package:theaccounts/screens/setting/components/setting.widgets.dart';

class ImageGalleryScreen extends StatefulWidget {
  const ImageGalleryScreen({Key? key}) : super(key: key);

  @override
  State<ImageGalleryScreen> createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomTopBar(topbartitle: 'Image Gallery'),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              alignment: Alignment.center,
              height: size.height * 0.2,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      // color: Color(0xFFC22ED0),
                      spreadRadius: 14,
                      blurRadius: 20,
                      blurStyle: BlurStyle.outer),
                ],
              ),
              child: Text(
                "Explore the Business",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: size.height * 0.2,
              width: size.width * 0.9,
              child: Column(
                children: [
                  Text("Categories",
                      style: Theme.of(context).textTheme.subtitle2),
                  CustomHorizontalListView(
                    title: "New Built Office",
                    child: Image(
                      image: AssetImage("assets/images/imagegalery.png"),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                alignment: Alignment.center,
                height: size.height * 0.2,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        // color: Color(0xFFC22ED0),
                        spreadRadius: 14,
                        blurRadius: 20,
                        blurStyle: BlurStyle.outer),
                  ],
                ),
                child: Image.asset("assets/images/ot.png")),
          ),
          AnimatedBottomBar(),
        ],
      ),
    );
  }
}
