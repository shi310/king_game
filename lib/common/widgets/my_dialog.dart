import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_game/common/common.dart';

void showMyLoading() => MyAlert.showLoading();
void hideMyLoading() => MyAlert.hideLoading();
void showMyBlock() => MyAlert.showBlock();
void hideMyBlock() => MyAlert.hideBlock();
void showMySnack({Widget? child}) => MyAlert.showSnack(child: child);

Future<void> showMyWidgetDialog({
  required Widget header,
  required Widget body,
  bool isDismissible = true,
  double? margin,
  double? borderRadius,
  EdgeInsetsGeometry? padding,
  bool? showBottom,
  Widget? footer,
}) async {
  final child = Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xFF606C83),
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      border: Border.all(
        color: Color(0xFF81868F),
        width: 2,
      ),
    ),
    child: Stack(clipBehavior: Clip.none, children: [
      body,

      Positioned(left: -24, top: -20, right: -24, child: Row(children: [
        SizedBox(height: MyConfig.app.alertHeaderHeight, child: MyIcons.alertHeaderLeft),
        SizedBox(height: MyConfig.app.alertHeaderHeight, child: MyIcons.alertHeaderTopLeft),
        Expanded(child: SizedBox(height: MyConfig.app.alertHeaderHeight, child: MyIcons.alertHeaderCenter)),
        SizedBox(height: MyConfig.app.alertHeaderHeight, child: MyIcons.alertHeaderTopRight),
        SizedBox(height: MyConfig.app.alertHeaderHeight, child: MyIcons.alertHeaderRight),
      ])),

      Positioned(left: 24, top: -20, right: 24, child: Align(alignment: Alignment.topCenter, child: SizedBox(
        height: MyConfig.app.alertHeaderHeight / 1.8,
        child: Center(child: FittedBox(child: header)),
      ))),

      if (showBottom == true)
        Positioned(left: -6, bottom: -20, right: -6, child: Row(children: [
          SizedBox(height: MyConfig.app.alertFooterHeight, child: MyIcons.alertBottomLeft1),
          SizedBox(height: MyConfig.app.alertFooterHeight, child: MyIcons.alertBottomLeft2),
          Expanded(child: SizedBox(height: MyConfig.app.alertFooterHeight, child: MyIcons.alertBottomCenter)),
          SizedBox(height: MyConfig.app.alertFooterHeight, child: MyIcons.alertBottomRight2),
          SizedBox(height: MyConfig.app.alertFooterHeight, child: MyIcons.alertBottomRight1),
        ])),

      if (showBottom == true)
        Positioned(left: -6, bottom: -25, right: -6, child: Align(alignment: Alignment.topCenter, child: SizedBox(
          height: MyConfig.app.alertFooterHeight,
          child: footer,
        ))),
    ]),
  );

  final result = await Get.generalDialog<dynamic>(
    barrierDismissible: isDismissible,
    barrierLabel: '',
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: GestureDetector(
              onTap: () {
                MyAudio.play(MyAudioPath.click);
                Get.back();
              },
              child: Container(
                color: Colors.black.withValues(alpha: 0.5),
              ),
            ),
          ),
          Center(
            child: SafeArea(child: Padding(padding: EdgeInsets.all(20), child: Material(
              color: Colors.transparent,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: Get.height * 0.8,
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Flexible(child: child),
                  GestureDetector(
                    onTap: () {
                      MyAudio.play(MyAudioPath.click);
                      Get.back();
                    },
                    child: Column(children: [
                      Container(height: 50, width: double.infinity, color: Colors.white.withAlpha(0)),
                      Container(height: 40, width: double.infinity, color: Colors.white.withAlpha(0), child: MyButton(onPressed: () => Get.back(), child: MyIcons.close)),
                    ]),
                  ),
                ]),
              ),
            ))),
          ),
        ],
      );
    },
  );

  if (!isDismissible && result == null) {
    showMyWidgetDialog(
      header: header,
      body: body,
      footer: footer,
      isDismissible: isDismissible,
      margin: margin,
      borderRadius: borderRadius,
    );
  }
}

Future<void> showMyDialog({
  String? title,
  String? content,
  bool isDismissible = true,
  Color? backgroundColor,
  String? confirmText,
  String? cancelText,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  double? margin,
  double? borderRadius,
}) async {
  final titleStyle = const TextStyle(fontSize: 16);
  final contentStyle = const TextStyle(fontSize: 13);

  final cancelButton = ElevatedButton(
    child: Text(cancelText ?? '取消'),
    onPressed: () {
      Get.back();
      onCancel?.call();
    },
  );

  final confirmButton = ElevatedButton(
    child: Text(confirmText ?? '确认'),
    onPressed: () async {
      Get.back(result: 'Dialog Result');
      onConfirm?.call();
    },
  );

  final column = Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null) Text(title, style: titleStyle),
      if (content != null && title != null) SizedBox(height: 16),
      if (content != null)  Flexible(child: SingleChildScrollView(scrollDirection: Axis. vertical, child: Text(content, style: contentStyle))),
      if ((title != null || content != null) && (confirmText != null || cancelText != null || onConfirm != null || onCancel != null)) SizedBox(height: 16),
      if (confirmText != null || cancelText != null || onConfirm != null || onCancel != null)
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (cancelText != null || onCancel != null) cancelButton,
            if ((cancelText != null || onCancel != null) && (confirmText != null || onConfirm != null)) SizedBox(width: 10),
            if (confirmText != null || onConfirm != null) confirmButton,
          ],
        ),
    ],
  );

  final child = Container(
    padding: EdgeInsets.fromLTRB(24, 24, 24, cancelText != null || onCancel != null || confirmText != null || onConfirm != null ? 16 : 28),
    child: column,
  );

  final result = await Get.generalDialog<dynamic>(
    barrierDismissible: isDismissible,
    barrierLabel: '',
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return SafeArea(
        child: Dialog(
          clipBehavior: Clip.antiAlias,
          insetPadding: margin == null ? const EdgeInsets.all(32) : EdgeInsets.all(margin),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius == null ? BorderRadius.circular(10) : BorderRadius.circular(borderRadius)),
          child: child,
        ),
      );
    },
  );

  if (isDismissible == false && result == null) {
    showMyDialog(
      title: title,
      content: content,
      isDismissible: isDismissible,
      backgroundColor: backgroundColor,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
      margin: margin,
      borderRadius: borderRadius,
    );
  }
}
