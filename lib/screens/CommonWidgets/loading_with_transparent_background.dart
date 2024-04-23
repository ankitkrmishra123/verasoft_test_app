import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKitThreeBounceLoading extends StatefulWidget {
  const SpinKitThreeBounceLoading({super.key});

  @override
  State<SpinKitThreeBounceLoading> createState() => _SpinKitThreeBounceLoadingState();
}

class _SpinKitThreeBounceLoadingState extends State<SpinKitThreeBounceLoading> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
              child: SpinKitThreeBounce(
                color: Colors.blue,
                size: 50.0,
                controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
              )
    ));
  }

 // buildLoadingTransBackg(BuildContext context) {
 //   return showDialog(
 //       context: context,
 //       barrierDismissible: false,
 //       builder: (BuildContext context) {
 //         return const Center(
 //           child: SpinKitThreeBounce(
 //             color: Colors.blue,
 //             size: 50.0,
 //             controller: AnimationController(
 //                 vsync: this, duration: const Duration(milliseconds: 1200)),
 //           ),
 //         );
 //       });
 // }
}

