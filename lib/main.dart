import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stylish/controller/adress_controller.dart';
import 'package:stylish/controller/location_controller.dart';
import 'package:stylish/provider/cartProvider.dart';
import 'package:stylish/view/screens/chekout/address/location_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stylish/view/screens/chekout/checkout_screen.dart';
import 'controller/page_controller.dart';
import 'core/theme/custom_colors.dart';
import 'provider/recently_browsed_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => PageControllerModel()),
    ChangeNotifierProvider(create: (_) => RecentlyBrowsed()),
    ChangeNotifierProvider(create: (_) => AdressController()),
    ChangeNotifierProvider(create: (_) => LocationController()),


    
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        dividerColor: const Color.fromARGB(255, 202, 202, 202),
        primarySwatch:
            black, // Here, you need to use a valid color from Colors class
        fontFamily: "eg_ar",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      supportedLocales: const [
        Locale('ar', 'AR'), // Arabic
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        // If the device locale is not supported, use the first one from the list (English)
        return supportedLocales.first;
      },
      home:  CheckoutScreen(),
    );
  }
}
