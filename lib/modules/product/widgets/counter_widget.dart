import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/modules/product/cubit/product_cubit.dart';

class SelectInfoItem extends StatelessWidget {
  final int number;
  final VoidCallback? onPressAdd;
  final VoidCallback? onPressMin;
  final TextEditingController controller;
  final Color? col;
  const SelectInfoItem({
    Key? key,
    required this.number,
    this.onPressAdd,
    required this.controller,
    this.onPressMin,
    this.col,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: TextField(
              onChanged: (value) {
                if (value == "") {
                  ProductCubit.get(context).update();
                }
              },
              textAlign: TextAlign.center,
              controller: controller,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: false,
                signed: true,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        Column(
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
                  child: const Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
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
                  child: const Center(
                    child: Text(
                      '-',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
