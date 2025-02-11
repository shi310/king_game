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
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: MyIcons.gameBackground, fit: BoxFit.fill),
          // color: Color(0xFF36374C),
        ),
        child: Column(children: [
          buildHeader(context),
          Expanded(
            child: Column(children: [
              Expanded(child: Obx(() => GridView.count(
                padding: EdgeInsets.all(10),
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 223 / 354,
                children: controller.state.skins.value.list.asMap().entries.map((item) {
                  int level = 1;

                  if (item.value.type == 's+') {
                    level = 2;
                  } else if (item.value.type == 'S++') {
                    level = 3;
                  }

                  final skinLevel = SizedBox(width: 40, child: MyIcons.storeSkinLevel(level));

                  final image = MyIcons.storeSkin(item.value.url);
                  final name = MyStrokeText(
                    text: item.value.name,
                    strokeWidth: 3,
                    dy: 0,
                    dx: 0,
                    fontSize: 13,
                  );
                  final price = MyStrokeText(
                    text: '${item.value.price}${Lang.points.tr}',
                    fontFamily: 'Sans',
                    fontSize: 14,
                  );

                  final body = Stack(children: [
                    image,

                    Positioned(
                      top: 4,
                      left: 8,
                      right: 8,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(child: name),
                      ),
                    ),

                    Positioned(
                      bottom: 14,
                      right: 10,
                      left: 46,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FittedBox(child: price),
                      ),
                    ),

                    Positioned(
                      bottom: 8,
                      left: 4,
                      child: skinLevel,
                    ),
                  ]);

                  return MyButton(onPressed: () {}, child: body);
                }).toList()
              ))),
              SizedBox(height: MyConfig.app.bottomHeight),
            ])
          ),
        ]),
      ),
    );
  }
}
