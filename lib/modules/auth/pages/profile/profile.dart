
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/modules/auth/pages/profile/edite_profile.dart';



class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: w,
        height: h,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const BackButton(),
                SizedBox(
                  width: w * 0.2,
                ),
                const title(text: 'الحساب الشخصي'),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 50,
            ),

            Align(
              alignment: Alignment.center,
              child: Container(




                height: h* 0.2,
                width: h*0.2,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(

                        decoration: BoxDecoration(

                            color: Color(0xffCCCCCC),

                            borderRadius: BorderRadius.circular(5))),
                    Positioned(
right: -10,
                        bottom: -10,
                        child: GestureDetector(
                          onTap: (){


                          },
                          child: SvgPicture.asset('assets/icons/camera_icon.svg'),
                        )),

                  ],
                ),
              ),
            ),
            SizedBox(height: h*0.2,),
            ProfileItem(
              img: 'assets/icons/profile_icon.svg',
              text: 'حسابي',
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EditeProfile()));
              },
            ),
            SizedBox(height: h*0.05,),
            ProfileItem(
              img: 'assets/icons/logout_icon.svg',
              text: 'تسجيل الخروج',
              onTap: (){},
            ),

          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String img;
  final String text;
  void Function()? onTap;
   ProfileItem({

    Key? key, required this.img, required this.text,required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(

          color: Color(0xffF5F6F9),
          borderRadius: BorderRadius.circular(15),


        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [



            Icon(Icons.arrow_left),         Spacer(),
            Text(text),SizedBox(width: 20,),        SvgPicture.asset(img),
          ],
        ),
      ),
    );
  }
}
