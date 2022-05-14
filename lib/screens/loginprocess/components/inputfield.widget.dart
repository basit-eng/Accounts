import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField(
      {required textcontroller,
      this.icon,
      this.hint,
      this.suffixicon,
      this.isvisible,
      Key? key})
      : super(key: key);

  final TextEditingController textcontroller = TextEditingController();
  final IconData? icon;
  final String? hint;
  final Widget? suffixicon;
  final bool? isvisible;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        lightSource: LightSource.topLeft,
        disableDepth: false,
        shadowLightColorEmboss: Colors.white,
        shadowDarkColorEmboss: Color.fromARGB(255, 182, 182, 182),
        depth: -3,
        color: Color.fromARGB(255, 232, 231, 231),
        intensity: 0.9,
        border: NeumorphicBorder(
          width: 1,
          color: Color.fromARGB(255, 211, 211, 211),
        ),
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
      ),
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 14),
          controller: textcontroller,
          obscureText: isvisible ?? false,
          decoration: InputDecoration(
            suffixIcon: suffixicon ?? null,
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF404041),
                ),
            icon: Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Icon(
                icon,
                size: 30,
                color: Color(0xFF90278E),
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
