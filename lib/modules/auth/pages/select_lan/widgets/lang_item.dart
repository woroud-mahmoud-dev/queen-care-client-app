import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';

class LangIteam extends StatefulWidget {
  String value;
  String name;
  String img;

  var groupValue;

  final void Function(String) onChanged;
  LangIteam(
      {Key? key,
      required this.value,
      required this.img,
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
      child:  Card(
        elevation: 6,


        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.img
              ,fit: BoxFit.cover,

                height: 50,
                width: 70,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10,top: 7),
                child: Text(
                  '${widget.name}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                      fontSize:  18 ,
                      color: selected ? kPrimaryColor : darkGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
