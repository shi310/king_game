import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(
        title: Text('Games'),
      ),
      body: Column(
          children: []

      ),
    );
  }
}
