import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class MineView extends StatelessWidget {
  const MineView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
        init: MineController(),
        builder: (controller) {
          return _buildBody(context, controller);
        }
    );
  }

  Widget _buildBody(BuildContext context, MineController controller) {
    return Scaffold(

      body: Column(
          children: []

      ),
    );
  }
}
