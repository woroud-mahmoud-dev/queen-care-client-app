
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/utlis/constant.dart';

class PeriodQuestions extends StatelessWidget {
   PeriodQuestions({Key? key, required this.tabController}) : super(key: key);
   final TabController tabController;
  TextEditingController lastPeriod = TextEditingController();
  TextEditingController howLongPeriod = TextEditingController();
  TextEditingController periodDaysNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Container(

      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: kPrimaryColor2,
      child: ListView(
        physics: BouncingScrollPhysics(),

        children: [
          SizedBox(
            height: h*0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: black,
                    )),
                const Spacer(),
                const Icon(
                  Icons.shopping_bag_sharp,
                  color: black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SvgPicture.asset(
                    'assets/icons/list.svg',
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h*0.02,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'حاسبة الدورة الشهرية',
                style: TextStyle(fontSize: 16),

              ),
            ),
          ),      SizedBox(
            height: h*0.02,
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: h*0.75,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(50, 30),
              ),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    'أجيبي عن الأسئلة التالية :',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: h*0.03,
                  ),
                  QuestionTextField(controller: lastPeriod,
                      label: '1  متى بدأ آخر حيض عدك؟'
                  ),
                  SizedBox(
                    height: h*0.05,
                  ),
                  QuestionTextField(controller: howLongPeriod,
                      label: '2  ما مدة الحيض لديك؟'


                  ),
                  SizedBox(
                    height: h*0.05,
                  ),
                  QuestionTextField(controller: periodDaysNumber,
                      label: '3  كم يوم تدوم دورتك الشهرية؟'


                  ),
                  SizedBox(
                    height: h*0.05,
                  ),
                  Center(
                    child: GestureDetector(
 onTap: (){
   tabController.animateTo(8);
 },
                      child: SizedBox(
                        width: w*0.72,
                        height: h*0.1,
                        child: Card(
                          color: kPrimaryColor2,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Text('تتبع الدورة الشهرية',style: TextStyle(color: Colors.white,fontSize: 16),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionTextField extends StatelessWidget {
  const QuestionTextField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText:label,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: darkGrey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor2),
          ),
          labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              ),
        ),
        obscureText: true,
        controller: controller,
      ),
    );
  }
}

