import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:home_utility/screens/detailsScreen.dart';
import 'package:home_utility/screens/logInScreen.dart';
import 'package:home_utility/screens/ourServices.dart';
import 'package:home_utility/screens/registrationScreen.dart';
import 'screens/welcomeScreen.dart';

void main() {
  runApp(HomeUtility());
}

class HomeUtility extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: WelcomeScreen(),
      initialRoute: LogInScreen.id,
      defaultTransition: Transition.fade,
      getPages: [
        GetPage(
          name: WelcomeScreen.id,
          page: () => WelcomeScreen(),
        ),
        GetPage(
          name: LogInScreen.id,
          page: () => LogInScreen(),
        ),
        GetPage(
          name: RegistrationScreen.id,
          page: () => RegistrationScreen(),
        ),
        GetPage(
          name: MainScreen.id,
          page: () => MainScreen(),
        ),
        GetPage(
          name: DetailsScreen.id,
          page: () => DetailsScreen(),
        ),
      ],
    );
  }
}
