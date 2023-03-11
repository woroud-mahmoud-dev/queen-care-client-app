// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/cubit/locale_cubit.dart';
import 'package:queen_care/models/bloc_observer.dart';
import 'package:queen_care/modules/auth/pages/splach/splach_screen.dart';

import 'package:queen_care/network/local/cache_helper.dart';
import 'package:queen_care/network/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LocaleCubit()..getSavedLanguage(),
              ),
            ],
            child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
              builder: (context, state) {
                return MaterialApp(
                  locale: state.locale,
                  supportedLocales: const [Locale('en'), Locale('ar')],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  localeResolutionCallback: (deviceLocale, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (deviceLocale != null &&
                          deviceLocale.languageCode == locale.languageCode) {
                        return deviceLocale;
                      }
                    }

                    return supportedLocales.first;
                  },
                  theme: ThemeData(
                    fontFamily: 'JF',
                    textTheme:
                        Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
                  ),
                  debugShowCheckedModeBanner: false,
                  home: const Splach(),
                  // home: const ConvertToCompany(),
                );
              },
            ),
          );
        });
  }
}
