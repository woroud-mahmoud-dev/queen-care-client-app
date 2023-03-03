import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/cubit/locale_cubit.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/modules/auth/pages/login/login-screen.dart';
import 'package:queen_care/modules/auth/pages/register/register_screen.dart';
import 'package:queen_care/modules/auth/pages/select_lan/widgets/custom_text_button.dart';
import 'package:queen_care/modules/auth/pages/select_lan/widgets/lang_item.dart';
import 'package:queen_care/network/local/language_cache_helper.dart';

class SelectLanguage extends StatelessWidget {
  SelectLanguage({Key? key}) : super(key: key);

  final languageCacheHelper = LanguageCacheHelper();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: BlocConsumer<LocaleCubit, ChangeLocaleState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            width: w,
            height: h,
            decoration: customBoxDecoration,
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.05,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: h * 0.3,
                    width: w,
                  ),
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                Container(
                  height: 40,
                  color: lightGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('choose_lang'.tr(context)),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset('assets/icons/lan_icon.svg')
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LanguageWidget(
                      name: 'العربية',
                      value: 'ar',
                      groupValue: state.locale.languageCode,
                      onChanged: (va) {
                        context.read<LocaleCubit>().changeLanguage(va.toString());
                      },
                      img: 'assets/icons/sy.png',
                    ),
                    LanguageWidget(
                        img: 'assets/icons/uk.png',
                        name: 'English',
                        value: 'en',
                        groupValue: state.locale.languageCode,
                        onChanged: (va) {
                          context
                              .read<LocaleCubit>()
                              .changeLanguage(va.toString());
                        }),
                  ],
                ),
                SizedBox(height: h * 0.1.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Register()));
                      },
                      title: 'sign_up'.tr(context),
                    ),
                    const SizedBox(
                      height: 40,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Divider(
                          color: darkGrey,
                        ),
                      ),
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Login()));
                      },
                      title: 'sign_in'.tr(context),
                    ),
                  ],
                ),
                const Spacer()
              ],
            ),
          ),
        );
      },
    ));
  }
}
