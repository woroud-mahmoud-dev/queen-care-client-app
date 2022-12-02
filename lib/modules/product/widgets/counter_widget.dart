
import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';

class SelecInfotItem extends StatelessWidget {
  final int number;
  final VoidCallback? onPressAdd;
  final VoidCallback? onPressMin;
  final Color? col;
  const SelecInfotItem({
    Key? key,

    required this.number,
    this.onPressAdd,
    this.onPressMin,  this.col,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [   Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 25,
            width: 30,
            child: GestureDetector(

              onTap: onPressAdd,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5),

                ),
                child: Center(
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5,),

          SizedBox(
            height: 25,
            width: 30,
            child: GestureDetector(

              onTap: onPressMin,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5),

                ),
                child: Center(
                  child: const Text(

                    '-',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
        Container(
          margin: EdgeInsets.all(10),
          height: 35,
          width: 25,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(5),

          ),
          child: Center(
            child: Text(
              number.toString(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
        ),

      ],
    );
  }
}
