import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/modules/home/main_screen.dart';
class OrderDone extends StatelessWidget {
  const OrderDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: h,
        width: double.infinity,

        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/done.png'),fit: BoxFit.cover)
        ),
        child: Column(
          children:  [
            const Expanded(
                flex: 6,
                child: SizedBox()),
            Expanded(

              child:                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[

                  Text(
                    'تم الطلب بنجاح',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),),
            Expanded(

              child:                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[

                  Text(
                    'سيتم إرسال الحزمة الخاصة بك \nإلى العنوان , شكراً لك',
                    style: TextStyle(

                        color: darkGrey2,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),),
            Expanded(
              flex:1,
                child:      Padding(
              padding: const EdgeInsets.symmetric(

                  horizontal: 20.0,vertical: 5),
              child: GeneralButton(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (_)=> MainScreen()), (route) => false);

                },
                title: 'عودة إلى الرئيسية',
                margin: const EdgeInsets.symmetric(horizontal: 15),
                elevation: 7,
                padding: 15,),
            ),),
           Expanded(child: SizedBox()),


          ],
        ),
      ),
    );
  }
}
