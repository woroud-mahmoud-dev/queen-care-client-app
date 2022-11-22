
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
        width:MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height * 0.05
,
        decoration: BoxDecoration(
          color: Colors.white,
          // border: widget.last?Border.fromBorderSide(
          //   BorderSide(
          //     color: kPrimaryColor
          //   )
          // ): Border.symmetric(
          //   horizontal: BorderSide(color: kPrimaryColor)
          // )
        ),
        child: Row(
mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: Text(
                '${widget.name}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,

                    color:  kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
