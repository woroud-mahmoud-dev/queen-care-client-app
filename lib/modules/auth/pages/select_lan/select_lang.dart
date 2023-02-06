import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/cubit/locale_cubit.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/modules/auth/pages/login/login-screen.dart';
import 'package:queen_care/modules/auth/pages/register/register_screen.dart';
import 'package:queen_care/modules/auth/pages/select_lan/widgets/lang_item.dart';
import 'package:queen_care/network/local/language_cache_helper.dart';

class SelectLanguage extends StatelessWidget {
   SelectLanguage({Key? key}) : super(key: key);

  final languageCacheHelper = LanguageCacheHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<LocaleCubit, ChangeLocaleState>(
          listener: (context, state) {
            // if (state is ChangeLocaleState) {
            //   // Navigator.of(context)
            //   //     .push(MaterialPageRoute(builder: (_) => Login()));
            // }
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 40,
                  color: lightGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('اختر اللغة'),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset('assets/icons/lan_icon.svg')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                        context
                            .read<LocaleCubit>()
                            .changeLanguage(va.toString());
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
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Register()));
                        },
                        child: const Text(
                          'التسجيل',
                          style: TextStyle(color: kPrimaryColor),
                        )),
                    const SizedBox(
                      height: 40,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Divider(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => Login()));
                        },
                        child: const Text(
                          'تسجيل الدخول',
                          style: TextStyle(color: kPrimaryColor),
                        )),
                  ],
                ),
                const Spacer(),
              ],
            );
          },
        ));
  }
}
