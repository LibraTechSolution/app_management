import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'ui/routers/router_generator.dart';
import 'ui/screens/widgets/language/locale_constant.dart';
import 'ui/screens/widgets/language/localizations_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => RefreshConfiguration(
            footerTriggerDistance: 15,
            dragSpeedRatio: 0.91,
            headerBuilder: () => const MaterialClassicHeader(),
            footerBuilder: () => const ClassicFooter(),
            enableLoadingWhenNoData: false,
            enableRefreshVibrate: false,
            enableLoadMoreVibrate: false,
            shouldFooterFollowWhenNotFull: (state) {
              return false;
            },
            child: MaterialApp(
                title: "IBlock",
                debugShowCheckedModeBanner: false,
                locale: _locale,
                theme: ThemeData(
                  fontFamily: "Open",
                  scaffoldBackgroundColor: Colors.white,
                ),
                initialRoute: RouterGenerator.routeSplash,
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('vi', ''),
                  Locale('ja', ''),
                ],
                localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  DefaultMaterialLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                  DefaultWidgetsLocalizations.delegate,
                ],
                localeResolutionCallback: (locale, supportedLocales) {
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale?.languageCode &&
                        supportedLocale.countryCode == locale?.countryCode) {
                      return supportedLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                onGenerateRoute: RouterGenerator.generateRoute)));
  }
}
