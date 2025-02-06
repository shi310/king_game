import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_game/common/common.dart';

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
                SizedBox(height: 10),
                _buildSwiper(context),
                SizedBox(height: 32),
                _buildGameButton(
                  onPressed: () {},
                  context,
                  index: 1,
                  title: '转盘抽奖',
                  time: '1h20s',
                ),
                SizedBox(height: 20),
                _buildGameButton(
                  onPressed: () {},
                  context,
                  index: 2,
                  title: '5V5玩法',
                  time: '1h20s',
                ),
                SizedBox(height: 20),
                _buildGameButton(
                  onPressed: () {},
                  context,
                  index: 3,
                  title: '大小竞猜',
                  time: '1h20s',
                ),
                SizedBox(height: 20),
                _buildGameButton(
                  onPressed: () {},
                  context,
                  index: 4,
                  title: '大富翁',
                  time: '1h20s',
                ),
                SizedBox(height: 20),
                _buildGameButton(
                  onPressed: () {},
                  context,
                  index: 5,
                  title: '大小竞猜',
                  time: '1h20s',
                ),
                SizedBox(height: 20),
                SizedBox(height: MyConfig.app.bottomHeight),
              ])
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildGameButton(BuildContext context, {
    required int index,
    required String title,
    required String time,
    void Function()? onPressed,
  }) {
    double bodyWidth = Get.width;

    if(kIsWeb || bodyWidth > MyConfig.app.webBodyMaxWidth) {
      bodyWidth = Get.width.clamp(200, MyConfig.app.webBodyMaxWidth);
    }

    final buttonHeight = bodyWidth * 220 / 750;

    final boxBack = Container(
      height: buttonHeight,
      width: bodyWidth,
      color: Colors.red.withAlpha(0),
    );

    final background = MyIcons.gamePicture2(index);

    final titleBox = Row(children: [
      SizedBox(height: 60, child: MyIcons.gameTitle(index)),
      SizedBox(width: 10),
      Transform.rotate(
        angle: -3 * 3.14159 / 180,
        child: MyStrokeText(
          text: title,
          fontSize: 20,
          fontFamily: 'Sans',
          strokeWidth: 4,
          dy: 5,
        ),
      )
    ]);

    final timerBox = Stack(alignment: AlignmentDirectional.center, children: [
      Row(children: [
        SizedBox(height: 36, child: MyIcons.gameTimer),
        SizedBox(width: 5),
        SizedBox(height: 20, child: MyIcons.gameIcon(index)),
      ]),
      Positioned.fill(
        left: 32,
        right: 18 + 8,
        child: Center(child: FittedBox(child: Row(children: [
          Text('游戏时长 ', style: TextStyle(color: Colors.white, fontSize: 13)),
          Text(time, style: TextStyle(color: Color(0xFFF1CD60), fontSize: 13)),
        ]))),
      ),
    ]);

    final body = Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomStart,
      children: [
        boxBack,

        Positioned(
          bottom: 0,
          left: 0,
          right: 10,
          child: background,
        ),

        Positioned(
          bottom: buttonHeight - 60 + (60 - (bodyWidth - 10) * (72 - 14) / 714) / 2,
          left: 10,
          child: titleBox,
        ),

        Positioned(
          bottom: (buttonHeight - (bodyWidth - 10) * 72 / 714 - 30) / 2,
          left: 10,
          child: timerBox,
        ),
      ],
    );

    return MyButton(onPressed: onPressed, child: body);
  }

  Widget _buildSwiper(BuildContext context) {
    double bodyWidth = Get.width;

    if(kIsWeb || bodyWidth > MyConfig.app.webBodyMaxWidth) {
      bodyWidth = Get.width.clamp(200, MyConfig.app.webBodyMaxWidth);
    }

    final swiper = Swiper(
      autoplay: true,
      viewportFraction: 0.8,
      scale: 0.92,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: bodyWidth * 0.85,
          height: bodyWidth * 0.85 * 0.53,
          decoration: BoxDecoration(
            image:
            DecorationImage(image: MyIcons.gameBanner(index + 1)),
          ),
        );
      },
      itemCount: 3,
      control: SwiperControl(size: 0),
    );

    return SizedBox(
      width: bodyWidth,
      height: bodyWidth * 0.85 * 0.53,
      child: swiper,
    );
  }
}
