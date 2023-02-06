import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

// ignore: must_be_immutable
class GenderWidget extends StatefulWidget {
  final int value;
  final String name;
  final IconData icon;
  // ignore: prefer_typing_uninitialized_variables
  var groupValue;

  final void Function(int) onChanged;
  GenderWidget(
      {Key? key,
      required this.value,
      required this.name,
      required this.icon,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: SizedBox(
        width: selected ? 100 : 90,
        height: selected ? 65 : 55,
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: selected ? kPrimaryColor : Colors.grey,
                  width: selected ? 1.3 : 1),
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(widget.icon,
                    size: selected ? 30 : 20, color: kPrimaryColor),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: selected ? 16 : 14,
                        fontWeight:
                            !selected ? FontWeight.normal : FontWeight.bold,
                        color: kPrimaryColor),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
