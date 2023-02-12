
import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class ItemWidgetWithIcon extends StatefulWidget {
  int value;
  String name;

  var groupValue;
Widget? widget2;
  final void Function(int) onChanged;
  ItemWidgetWithIcon(
      {Key? key,
        required this.value,
        required this.name,

        required this.groupValue,this.widget2,
        required this.onChanged})
      : super(key: key);

  @override
  _ItemWidgetWithIconState createState() => _ItemWidgetWithIconState();
}

class _ItemWidgetWithIconState extends State<ItemWidgetWithIcon> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child:Container(
        height: 40,
        width: MediaQuery.of(context).size.width*0.31,
        decoration: BoxDecoration(
          color:selected?kPrimaryColor: darkGrey1,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.widget2!,
            Text(widget.name,style:  TextStyle(color: selected?Colors.white: darkGrey2,fontSize: 14),textAlign: TextAlign.center,maxLines: 2,),
          ],
        ),
      ),
    );
  }
}



class ItemWidget extends StatefulWidget {
  int value;
  String name;

  var groupValue;

  final void Function(int) onChanged;
  ItemWidget(
      {Key? key,
        required this.value,
        required this.name,

        required this.groupValue,
        required this.onChanged})
      : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child:Container(
        height: 40,
        width: MediaQuery.of(context).size.width*0.31,
        decoration: BoxDecoration(
          color:selected?kPrimaryColor: darkGrey1,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(child: Text(widget.name,style:  TextStyle(color:selected?Colors.white: darkGrey2,fontSize: 14),textAlign: TextAlign.center,maxLines: 2,)),
      ),
    );
  }
}
