import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/cubit/locale_cubit.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/modules/auth/pages/login/login-screen.dart';
import 'package:queen_care/modules/auth/pages/register/register_screen.dart';
import 'package:queen_care/modules/auth/pages/select_lan/widgets/lang_item.dart';
import 'package:queen_care/network/local/language_cache_helper.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  LanguageCacheHelper languageCacheHelper = LanguageCacheHelper();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>WelcomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<LocaleCubit, ChangeLocaleState>(
          listener: (context, state) {
            if (state is ChangeLocaleState) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Login()));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
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
                const Divider(
                  color: kPrimaryColor,
                ),
                LangIteam(
                  name: 'العربية',
                  value: 'ar',
                  groupValue: state.locale.languageCode,
                  onChanged: (va) {
                    if (va != null) {
                      context.read<LocaleCubit>().changeLanguage(va.toString());
                    }
                  },
                ),
                const Divider(
                  color: kPrimaryColor,
                ),
                LangIteam(
                    name: 'English',
                    value: 'en',
                    groupValue: state.locale.languageCode,
                    onChanged: (va) {
                      if (va != null) {
                        context
                            .read<LocaleCubit>()
                            .changeLanguage(va.toString());
                      }
                    }),
                const Divider(
                  color: kPrimaryColor,
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
                      child:  RotatedBox(
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
