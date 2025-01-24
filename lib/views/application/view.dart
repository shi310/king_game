import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_game/common/common.dart';
import 'package:king_game/views/application/games/index.dart';
import 'package:king_game/views/application/mine/index.dart';
import 'package:king_game/views/application/store/index.dart';

import 'controller.dart';

class ApplicationView extends GetView<ApplicationController> {
  const ApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child: _buildBody(context)),
        _buildFooter(context),
      ]),
    );
  }

  Widget _buildBody(BuildContext context) {
    return IndexedStack(
      children: [
        GamesView(),
        StoreView(),
        MineView(),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 18),
            color: Color(0xFF002c58).withValues(alpha: 0.9),
            blurRadius: 10,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 2),

          _buildNavigation(
            context: context,
            index: 0,
            height: 100,
            title: Lang.footerGames.tr,
            icon: MyIcons.footerGames,
          ),

          const SizedBox(width: 2),

          _buildNavigation(
            context: context,
            index: 1,
            height: 100,
            title: Lang.footerStore.tr,
            icon: MyIcons.footerStore,
          ),

          const SizedBox(width: 2),

          _buildNavigation(
            context: context,
            index: 2,
            height: 100,
            title: Lang.footerMine.tr,
            icon: MyIcons.footerMine,
          ),

          const SizedBox(width: 2),
        ],
      ),
    );
  }

  Widget _buildNavigation({
    required BuildContext context,
    required int index,
    required double height,
    required String title,
    required Widget icon,
  }) {
    return Obx(() {
      final radius = Radius.circular(20);
      final onPressed = controller.state.pageIndex == index ? null : () => controller.state.pageIndex = index;
      final flex = controller.state.pageIndex == index ? 2 : 1;
      final boxColor = controller.state.pageIndex == index ? Color(0XFF00AAFF) : Color(0XFF00599C);
      final opacity = controller.state.pageIndex == index ? 1.0 : 0.0;
      final backgroundColor = controller.state.pageIndex == index ? Color.fromARGB(255, 97, 211, 250) : Color.fromARGB(255, 58, 133, 202);


      final selectedText = MyStrokeText(
        text: title,
        fontSize: 20,
        fontFamily: 'Sans',
        fontWeight: FontWeight.w800,
        strokeWidth: 2,
        strokeColor: 0xFF4D4D4D,
        textColor: 0xFFFFFFFF,
        shadowColor: 0xFF4D4D4D,
        // letterSpacing: 8,
        dx: 0.0,
        dy: 2.0,
      );


      return Expanded(
        flex: flex,
        child: LayoutBuilder(builder: (context, constraints) {
          final iconSize = constraints.maxWidth / 3;

          final defaultIcon = Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: iconSize, child: icon),
            SizedBox(height: 4),
            Text(title, style: TextStyle(fontSize: 14, color: Colors.white)),
          ]);

          final selectedIcon = SizedBox(height: iconSize, child: icon);

          final backgroundBox = Container(
            width: double.infinity,
            height: height,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft:  radius,
                topRight: radius,
              ),
            ),
            child: Stack(alignment: AlignmentDirectional.center, children: [
              Positioned.fill(top: 6, left: 2, right: 2, child: Container(
                height: height,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.only(
                      topLeft:  radius,
                      topRight: radius,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: boxColor,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 4,
                      ),
                    ]
                ),
              )),
              Positioned(right: -2, top: height / 5, child: SizedBox(width: 10, child: MyIcons.footerRightIcon)),
              Positioned(left: -2, top: height / 2, child: SizedBox(width: 10, child: MyIcons.footerLeftIcon)),
              Positioned.fill(child: Opacity(opacity: opacity, child: MyIcons.footerSelected)),
              if (controller.state.pageIndex == index) Positioned(top: height / 2, child: selectedText),
              if (controller.state.pageIndex != index) defaultIcon,
            ]),
          );
          return MyButton(
            onPressed: onPressed,
            child: Stack(alignment: AlignmentDirectional.center, children: [
              backgroundBox,
              if (controller.state.pageIndex == index)
                Transform.translate(
                  offset: Offset(0, -40),
                  child: selectedIcon,
                ),
            ],)
          );
        }),
      );
    });
  }
}
