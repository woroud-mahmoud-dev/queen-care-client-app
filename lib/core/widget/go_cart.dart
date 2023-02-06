import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

import '../../modules/cart/cart_screen.dart';

class GoCart extends StatelessWidget {
  const GoCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CartScreen()));
      },
      child: const Icon(
        Icons.shopping_bag_sharp,
        color: black,
      ),
    );
  }
}
