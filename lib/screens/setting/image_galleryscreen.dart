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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            CustomTopBar(topbartitle: 'Image Gallery'),
            Container(
              alignment: Alignment.center,
              height: size.height * 0.15,
              width: size.width * 0.85,
              // margin: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                    colors: [Color(0xFFFEA64C), Color(0xFFF4EEAB)]),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).cardColor,
                    spreadRadius: 0.33,
                    blurRadius: 0.4,
                  ),
                ],
              ),
              child: Text(
                "Explore the Business",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 28, bottom: 24),
              child: Container(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Categories",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Container(
                        height: size.height * 0.18,
                        width: double.maxFinite,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 20,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomHorizontalListView(
                              title: "New Built Office",
                              child: Image(
                                image:
                                    AssetImage("assets/images/imagegalery.png"),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Image.asset(
                      "assets/images/gallery.png",
                      // height: size.height * 0.2,
                      width: double.maxFinite,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            // Spacer(),
            SizedBox(
              height: 30,
            ),
            AnimatedBottomBar(),
          ],
        ),
      ),
    );
  }
}
