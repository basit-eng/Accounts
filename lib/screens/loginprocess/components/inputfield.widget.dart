import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField(
      {required textcontroller,
      this.icon,
      this.hint,
      this.suffixicon,
      this.keyboardtype,
      required this.isfieldCircle,
      Key? key})
      : super(key: key);

  final TextEditingController textcontroller = TextEditingController();
  final IconData? icon;
  final String? hint;
  final Widget? suffixicon;
  final TextInputType? keyboardtype;
  final bool isfieldCircle;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        lightSource: LightSource.topLeft,
        disableDepth: false,
        shadowLightColorEmboss: Colors.white,
        shadowDarkColorEmboss: Color.fromARGB(255, 182, 182, 182),
        depth: isfieldCircle ? 5 : -3,
        color:
            isfieldCircle ? Colors.white : Color.fromARGB(255, 232, 231, 231),
        intensity: 0.9,
        border: NeumorphicBorder(
          width: isfieldCircle ? 0 : 1,
          color: Color.fromARGB(255, 211, 211, 211),
        ),
        boxShape: isfieldCircle
            ? NeumorphicBoxShape.circle()
            : NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
      ),
      // margin: EdgeInsets.all(8),
      child: Padding(
        padding: isfieldCircle
            ? EdgeInsets.all(0)
            : EdgeInsets.only(left: 20.0, top: 4, bottom: 4, right: 08),
        child: TextField(
          keyboardType: keyboardtype ?? TextInputType.text,
          textAlign: isfieldCircle ? TextAlign.end : TextAlign.start,
          style: TextStyle(
              fontSize: isfieldCircle ? 14 : 16,
              fontWeight: isfieldCircle ? FontWeight.w300 : FontWeight.w400),
          controller: textcontroller,
          decoration: InputDecoration(
            suffixIcon: suffixicon ?? null,
            hintText: hint,
            hintStyle: isfieldCircle
                ? Theme.of(context).textTheme.subtitle1
                : Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.grey.withOpacity(0.9),
                    fontWeight: FontWeight.w400),
            icon: Icon(
              icon,
              size: 30,
              color: Colors.purple,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
