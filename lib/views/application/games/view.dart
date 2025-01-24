import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class GamesView extends StatelessWidget {
  const GamesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GamesController>(
      init: GamesController(),
      builder: (controller) {
        return _buildBody(context, controller);
      }
    );
  }

  Widget _buildBody(BuildContext context, GamesController controller) {
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
