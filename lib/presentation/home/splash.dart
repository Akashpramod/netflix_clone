import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, required this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => widget.child!,
          ),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Center(
          child:Image(image: NetworkImage('https://th.bing.com/th/id/OIP.1dpM1N9v8Qxz5pVEE5GCQwHaHa?pid=ImgDet&w=192&h=192&c=7&dpr=1.5',),height: 300,width: double.infinity,),
        ),
        
      ]),
    );
  }
}