import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hojayegadriverapp/Authview/loginscreen.dart';
import 'package:hojayegadriverapp/Screen/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalOtp;
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    getValidation();
    super.initState();
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? driver_id = sharedPreferences.getString('driver_id');
    print("driver id in splash screen $driver_id");
    finalOtp = driver_id;
    _navigateToHome();
  }

  _navigateToHome() {
    Future.delayed(const Duration(milliseconds:35),() {
      if (finalOtp == null || finalOtp ==  '') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePage()));
      }
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset('assets/images/splash.png', fit: BoxFit.fill,),
      ),
    );
  }
}
