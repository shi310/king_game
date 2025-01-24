import 'package:flutter/cupertino.dart';

class MyStrokeText extends StatelessWidget {
  const MyStrokeText(
      {super.key,
      this.text = '',
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.strokeWidth = 2,
      this.strokeColor = 0xFF000000,
      this.textColor = 0xFFFFFFFF,
      this.shadowColor = 0xFF000000,
      this.letterSpacing = 0.0,
      this.dx = 0.0,
      this.dy = 0.0});
  final String text;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double strokeWidth;
  final int strokeColor;
  final int textColor;
  final int shadowColor;
  final double dx;
  final double dy;
  final double letterSpacing;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 描边的文字
        Text(
          text,
          style: TextStyle(
            letterSpacing: letterSpacing,
            fontFamily: 'Sans',
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2.5
              ..color = const Color(0xFF000000), // 描边颜色
          ),
        ),
        // 阴影的文字
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Sans',
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFFFFFFF), // 文字颜色
            shadows: const [
              Shadow(
                color: Color(0xFF000000), // 阴影颜色
                offset: Offset(0.0, 3), // 阴影偏移
              ),
            ],
          ),
        ),
      ],
    );
  }
}
