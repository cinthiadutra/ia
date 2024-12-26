import 'package:bkopen/app/core/binds/core_bindings.dart';
//import 'package:bkopen/proposal_pending%20%20/controllers/proposal_against_atualization_chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/routes/AppPages.dart';
import 'app/theme/bkopencolors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: BKOpenColors.white, // navigation bar color
      statusBarColor: BKOpenColors.white, // status bar color
      statusBarIconBrightness: Brightness.dark));


  // await DotEnv().load('.env');
  runApp(GetMaterialApp(
    locale: const Locale('pt', 'BR'),
    supportedLocales:[
      const Locale('pt', 'BR'),
      const Locale('en', 'US'),
    ] ,
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      

    ],
    //  title: AppConstants.appTitle,
    theme: ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: BKOpenColors.white,
      appBarTheme: const AppBarTheme(
        elevation: 2,
        color: BKOpenColors.white,
        iconTheme: IconThemeData(
          color: BKOpenColors.primary,
        ),
      ),
      primaryColor: BKOpenColors.white,
      fontFamily: 'Roboto',
      primaryTextTheme: const TextTheme(
          //  headline6: Styles.appbarTitle,
          ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Palette.primarySwatch)
          .copyWith(secondary: BKOpenColors.secondary),
    ),
    initialRoute: PageRoutes.initpage,
    getPages: AppPages.pages,
    debugShowCheckedModeBanner: false,
    initialBinding: CoreBindings(),
    
  ));
}

