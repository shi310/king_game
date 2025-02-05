import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_game/common/common.dart';

import 'controller.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
        init: StoreController(),
        builder: (controller) {
          return _buildBody(context, controller);
        }
    );
  }

  Widget _buildBody(BuildContext context, StoreController controller) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: MyIcons.gameBackground, fit: BoxFit.fill),
        ),
        child: Column(
            children: []

        ),
      ),
    );
  }
}
