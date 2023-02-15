/* import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kayem_akarak/domain/use_cases/register_usecase.dart';
import 'package:image_picker/image_picker.dart';

import '../app/di.dart';
import '../domain/use_cases/login_usecase.dart';

class screen1 extends StatefulWidget {
  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  final LoginUseCase loginUseCase = instance<LoginUseCase>();

  final RegisterUseCase registerUseCase = instance<RegisterUseCase>();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                getProfileImage(ImageSource.gallery);
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              )),
          SizedBox(
            height: 500,
          ),
          ElevatedButton(
              onPressed: () {
                //  registerUseCase.execude(profileImage);
              },
              child: Container(
                width: 100,
                height: 100,
              ))
        ],
      )),
    );
  }
}
 */