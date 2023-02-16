// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/utils/constant.dart';

class QuestionsAnswerWidget extends StatefulWidget {
  final String value;
  final String name;

  var groupValue;

  final void Function(String) onChanged;
  QuestionsAnswerWidget(
      {Key? key,
      required this.value,
      required this.name,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  _QuestionsAnswerWidgetState createState() => _QuestionsAnswerWidgetState();
}

class _QuestionsAnswerWidgetState extends State<QuestionsAnswerWidget> {
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
            ? MediaQuery.of(context).size.height * 0.1
            : MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: selected ? kPrimaryColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kPrimaryColor)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: selected ? 12.sp : 12.sp,
                            color: selected ? kPrimaryColor : darkGrey2),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
