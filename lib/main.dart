import 'package:flutter/material.dart';
import 'package:dose_care/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';

int? isViewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Dose Tracker",
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'WorkSans',
          ),
          initialRoute: isViewed != 0 ? '/onboarding' : '/',
          // initialRoute: '/onboarding',
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
