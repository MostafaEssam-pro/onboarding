// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:onboarding/components/slider_show.dart';

class AppRoot extends StatelessWidget{
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return (
      // ignore: prefer_const_constructors
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SliderShow()

      )
    );

  }

}

