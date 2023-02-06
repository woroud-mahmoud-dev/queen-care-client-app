import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

// ignore: must_be_immutable
class CustomRadioButton extends StatefulWidget {
  final int value;
  final  String name;

  var groupValue;

  final void Function(int) onChanged;
  CustomRadioButton(
      {Key? key,
        required this.value,
        required this.name,

        required this.groupValue,
        required this.onChanged})
      : super(key: key);

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: SizedBox(
        width: selected
            ? MediaQuery.of(context).size.width * 0.3
            : MediaQuery.of(context).size.width * 0.3,
        height: selected
            ? MediaQuery.of(context).size.height * 0.11
            : MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child:  Text(
                    widget.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: selected ? 14 : 12,
                        fontWeight:
                        !selected ? FontWeight.bold : FontWeight.bold,
                        color:  selected ?kPrimaryColor :darkGrey2),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.all(5),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: selected?kPrimaryColor:Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: kPrimaryColor
                    )
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
