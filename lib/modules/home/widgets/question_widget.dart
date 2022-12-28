
import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';

// ignore: must_be_immutable
class QuestionWidget extends StatefulWidget {
  String value;
  String name;

  var groupValue;

  final void Function(String) onChanged;
  QuestionWidget(
      {Key? key,
        required this.value,
        required this.name,

        required this.groupValue,
        required this.onChanged})
      : super(key: key);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: SizedBox(
        width: selected
            ? MediaQuery.of(context).size.width * 0.6
            : MediaQuery.of(context).size.width * 0.6,
        height: selected
            ? MediaQuery.of(context).size.height * 0.11
            : MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(

              // color: selected ?kPrimaryColor2:Colors.white,
              // shape: RoundedRectangleBorder(
              //   side: BorderSide(
              //       width: selected ? 1.5 : 1),
              //   borderRadius: BorderRadius.circular(7),
              // ),
              elevation: 5,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      '${widget.name}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: selected ? 20 : 18,
                          fontWeight:
                          !selected ? FontWeight.bold : FontWeight.bold,
                          color:  selected ?kPrimaryColor :darkGrey2),
                    ),
                  ),
                  Spacer(),

                  Container(
                    margin: EdgeInsets.all(10),
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
              )),
        ),
      ),
    );
  }
}
