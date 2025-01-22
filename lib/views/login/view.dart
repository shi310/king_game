import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.state.title, style: TextStyle(color: Colors.black),),),
      body: Container(color: Colors.amber,),
    );
  }
}
