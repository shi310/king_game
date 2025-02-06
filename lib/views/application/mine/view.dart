import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_game/common/common.dart';

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
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: MyIcons.gameBackground, fit: BoxFit.fill),
        ),
        child: Column(children: [
          buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 20),
                _buildHeaderButtons(context),
                SizedBox(height: 20),
                _buildBodyButtons(context),
                SizedBox(height: 20),
                SizedBox(height: MyConfig.app.bottomHeight),
              ])
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildHeaderButtons(BuildContext context) {
    final height = kIsWeb || Get.width > MyConfig.app.webBodyMaxWidth ? 55.0 : 46.0;
    return Row(children: [
      SizedBox(width: 10),
      Expanded(child: buildButton(
        onPressed: () {},
        context: context,
        shadowColor: Color(0xFF944600),
        colors: [Color(0xFFFFB72E), Color(0xFFFBAC17)],
        height: height,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 30, child: MyIcons.headerStone),
          MyStrokeText(
            text: '购买点券',
            strokeWidth: 3,
            dy: 3,
            fontSize: 15,
            fontFamily: 'Sans',
          ),
        ]),
      )),
      SizedBox(width: 2),
      Expanded(child: buildButton(
        onPressed: () {},
        context: context,
        shadowColor: Color(0xFF944600),
        colors: [Color(0xFFF96312), Color(0xFFF96312)],
        height: height,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 30, child: MyIcons.headerCard),
          MyStrokeText(
            text: '购买点券',
            strokeWidth: 3,
            dy: 3,
            fontSize: 15,
            fontFamily: 'Sans',
          ),
        ]),
      )),
      SizedBox(width: 10),
    ]);
  }

  Widget _buildBodyButtons(BuildContext context) {
    final buttons = Column(children: [
      Row(children: [
        SizedBox(width: 10),
        Expanded(child: MyButton(onPressed: () {}, child: MyIcons.meButtonTopLeft)),
        Expanded(child: MyButton(onPressed: () {}, child: MyIcons.meButtonTopRight)),
        SizedBox(width: 10),
      ]),
      Row(children: [
        SizedBox(width: 10),
        Expanded(child: MyButton(onPressed: () {}, child: MyIcons.meButtonBottomLeft)),
        Expanded(child: MyButton(onPressed: () {}, child: MyIcons.meButtonBottomRight)),
        SizedBox(width: 10),
      ]),
    ]);
    final body = Stack(children: [
      buttons,
      Positioned(left: 7, right: 7, bottom: -8, child: MyIcons.meButtonBottomIcon)
    ]);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 10,
            spreadRadius: 2,
            blurStyle: BlurStyle.normal,
            color: Colors.black45,
          )
        ]
      ),
      child: body,
    );
  }
}
