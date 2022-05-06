import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    this.labelText,
    this.secondLabel,
    this.details,
    this.secondDetails,
    this.icon,
    this.color,
  }) : super(key: key);
  final String? labelText, details;
  final String? secondLabel, secondDetails;
  final IconData? icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      style:
          NeumorphicStyle(border: NeumorphicBorder.none(), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: color),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: Theme.of(context).iconTheme.size,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          title: Text(labelText ?? "",
              style: Theme.of(context).textTheme.bodyText1),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(details ?? "",
                style: Theme.of(context).textTheme.bodyText2),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Text('CW',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText2),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('$secondLabel',
                      style: Theme.of(context).textTheme.bodyText1),
                  Text('$secondDetails',
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({
    Key? key,
    required this.bartitle,
  }) : super(key: key);

  final String bartitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.topLeft,
            child: Text('$bartitle',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
          ),
        ),
        Container(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_rounded,
              size: 24,
              color: Color.fromARGB(255, 168, 19, 171),
            ),
          ),
        )
      ],
    );
  }
}
