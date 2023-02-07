
import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
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
            hintStyle: const TextStyle(fontSize: 14),
            suffix: Container(
              height: 30,

              width: 30,


              decoration: const BoxDecoration(color: kPrimaryColor,
                  shape: BoxShape.circle,

              ),
              child: const Icon(Icons.filter_list_alt,color: Colors.white,),

            ),

            prefixIcon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.search,color: kPrimaryColor,))),
      ),
    );
  }
}
