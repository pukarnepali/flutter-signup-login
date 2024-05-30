import 'package:flutter/material.dart';
import 'package:sign_up/home_screen.dart';
import 'package:sign_up/local_storage.dart';
import 'package:sign_up/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StorageHelper storageHelper = StorageHelper();
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    var isLogin = await storageHelper.getData();
    Future.delayed(
      Duration(milliseconds: 2000),
      () {
        if (isLogin == true) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => (false),
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => (false),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
