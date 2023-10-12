import 'package:flutter/material.dart';
import 'package:todo_app/view/screens/login_screen.dart';
import 'package:todo_app/view_model/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.network(
          'https://cdn.icon-icons.com/icons2/1542/PNG/512/todo_107301.png',
        ),
      ),
    );
  }
}
