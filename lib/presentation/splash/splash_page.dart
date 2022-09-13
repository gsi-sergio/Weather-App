import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizing/sizing.dart';
import 'package:weather_app/application/splash/index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
      return Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('Weather App', style: TextStyle(fontSize: 20.fs),)
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: 100.ss,
                child: const LinearProgressIndicator(color: Colors.blue),
              )
            ],
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width,
          //       height: 200,
          //       child: Container(
          //         alignment: Alignment.center,
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             // SizedBox(
          //             //   width: MediaQuery.of(context).size.width,
          //             //   height: 200,
          //             //   child: Container(
          //             //     alignment: Alignment.center,
          //             //     child: const FlareActor(
          //             //       'assets/animation/khaleesi_splash_anim.flr',
          //             //       animation: 'splash',
          //             //       shouldClip: false,
          //             //     ),
          //             //   ),
          //             // ),

          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      );
    });
  }
}
