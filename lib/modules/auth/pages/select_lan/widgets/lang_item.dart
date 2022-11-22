import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';

class LangIteam extends StatefulWidget {
  String value;
  String name;

  var groupValue;

  final void Function(String) onChanged;
  LangIteam(
      {Key? key,
      required this.value,
      required this.name,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  _LangIteamState createState() => _LangIteamState();
}

class _LangIteamState extends State<LangIteam> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: const BoxDecoration(
          color: Colors.white,

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Text(
                '${widget.name}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                    fontSize: selected ? 18 : 15,
                    color: selected ? kPrimaryColor : darkGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
