
import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';

class searchBar extends StatelessWidget {
  const searchBar({
    Key? key,
    required this.w,
  }) : super(key: key);

  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: w,
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: Colors.white
          )
      ),

      child: TextFormField(

        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hoverColor: Colors.grey,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10.0),
            hintText: "البحث ",
            suffix: Container(
              height: 30,
              width: 30,

              decoration: const BoxDecoration(color: kPrimaryColor,
                  shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/images/filtter.png'))
              ),
           
            ),

            prefixIcon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.search))),
      ),
    );
  }
}
