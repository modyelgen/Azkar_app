import 'package:flutter/material.dart';
import 'package:untitled/features/home/presentation/views/home_view.dart';
import 'package:untitled/features/splash/presentation/views/widgets/splash_body.dart';
class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    navigateToHome(){
      Future.delayed(const Duration(seconds: 2),(){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const HomeView();
        }));
      });
    }
     navigateToHome();
    return const  Scaffold(
      body:  SplashBody(),
    );
  }
}
