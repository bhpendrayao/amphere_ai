import 'package:flutter/material.dart';
import 'package:amphere_ai/screens/login_screen.dart';
import 'package:amphere_ai/screens/otp_screen.dart';
import 'package:amphere_ai/screens/home_screen.dart';


///void main() => runApp(Stealth());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Amphere());
}

class Amphere extends StatefulWidget {
  @override
  State<Amphere> createState() => _AmphereState();
}
class _AmphereState extends State<Amphere>
{
  var islogin=false;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFFFFFFFF)),
        ),
      ),
      initialRoute:LoginScreen.id,
      routes:{
        LoginScreen.id : (context)=>LoginScreen(),
         Otp.id : (context)=>Otp(),
        HomeScreen.id : (context)=>HomeScreen(),
      },
    );
  }
}


