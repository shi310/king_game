import 'package:flutter/material.dart';
import 'package:king_game/common/common.dart';

class MyButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const MyButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<MyButton> {
  double _opacity = 1.0;  // 默认透明度为1（完全不透明）

  void _onTapDown(TapDownDetails details) {
    // 按下时改变透明度
    setState(() {
      _opacity = 0.75;
    });
  }

  void _onTapUp(TapUpDetails details) {
    // 释放时恢复透明度
    setState(() {
      _opacity = 1.0;
    });
  }

  void _onTapCancel() {
    // 如果手势被取消（例如手指离开按钮区域），恢复透明度
    setState(() {
      _opacity = 1.0;
    });
  }

  void _onPressed() {
    // 确保点击时播放音效
    if (widget.onPressed != null) {
      MyAudio.play(MyAudioPath.click);
    }
    widget.onPressed?.call();
  }

  void _onMouseEnter(PointerEvent details) {
    // 鼠标移入时仅改变按钮样式，不播放音效
    setState(() {
      _opacity = 0.9;
    });
  }

  void _onMouseExit(PointerEvent details) {
    // 鼠标移出时恢复透明度
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onPressed == null) {
      return widget.child;
    }
    return MouseRegion(
      onEnter: _onMouseEnter,
      onExit: _onMouseExit,
      child: GestureDetector(
        onTap: _onPressed,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 100),
          child: widget.child,
        ),
      ),
    );
  }
}