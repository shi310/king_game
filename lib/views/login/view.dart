import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_game/common/common.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingHorizontal = Get.width * 0.16;

    if(kIsWeb) {
      paddingHorizontal = MediaQuery.of(context).size.width.clamp(200, MyConfig.app.webBodyMaxWidth) * 0.16;
    }

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          const SizedBox(height: 24),
          Padding(padding: EdgeInsets.symmetric(horizontal: paddingHorizontal), child: SizedBox(width: double.infinity, child: MyIcons.logo)),
        ]),

        Column(children: [
          _buildTextField(
            context: context,
            hintText: Lang.loginViewAccount.tr,
            controller: controller.accountController,
            margin: EdgeInsets.symmetric(horizontal: paddingHorizontal / 2),
            height: 55,
            prefixIcon: SizedBox(width: 60, height: 60, child: Center(child: SizedBox(width: 30, height: 30, child: MyIcons.loginPhone,),)),
          ),

          const SizedBox(height: 10),

          _buildTextField(
            context: context,
            hintText: Lang.loginViewEmail.tr,
            controller: controller.accountController,
            margin: EdgeInsets.symmetric(horizontal: paddingHorizontal / 2),
            height: 55,
            prefixIcon: SizedBox(width: 60, height: 60, child: Center(child: SizedBox(width: 30, height: 30, child: MyIcons.loginEmail,),)),
            suffixIcon: SizedBox(width: 60, height: 60, child:
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // 去掉圆角
                  ),
                ),
              ),
              child: Text('发送', style: TextStyle(color: Color(0XFF397DEA))),
            ),
            ),
          ),

          const SizedBox(height: 10),

          _buildLoginButton(
            context: context,
            margin: EdgeInsets.symmetric(horizontal: paddingHorizontal / 2),
            onPressed: controller.onLogin,
            height: 55,
          ),
        ]),

        Container(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal / 2),
          height: 200,
          width: double.infinity,
          color: Colors.black.withValues(alpha: 0.5),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(children: [
              Expanded(child: _buildButton(
                context: context,
                onPressed: () {},
                height: 45,
                child: FittedBox(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(width: 20, height: 20, child: MyIcons.loginGoogle),
                  SizedBox(width: 10),
                  Text(Lang.loginViewGoogle.tr, style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                ],),),
              ),),

              const SizedBox(width: 10,),

              Expanded(child: _buildButton(
                context: context,
                onPressed: () {},
                height: 45,
                child: FittedBox(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(width: 23, height: 23, child: MyIcons.loginFacebook),
                  SizedBox(width: 10),
                  Text(Lang.loginViewFacebook.tr, style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                ],),),
              ),),
            ],),

            const SizedBox(height: 10),

            _buildButton(
              context: context,
              onPressed: () {},
              height: 45,
              child: FittedBox(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(width: 23, height: 23, child: MyIcons.loginGuest),
                SizedBox(width: 10),
                Text(Lang.loginViewGuest.tr, style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
              ],),),
            ),
          ],),
        ),
      ],
    );

    return Stack(alignment: AlignmentDirectional.topCenter, children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: MyIcons.loginBackground,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SafeArea(child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.black.withAlpha(0),),
        body: body,
      )),
    ]);
  }

  Widget _buildTextField({
    required BuildContext context,
    required String hintText,
    required TextEditingController controller,
    EdgeInsetsGeometry? margin,
    Widget? prefixIcon,
    Widget? suffixIcon,
    double? height,
  }) {
    final borderRadius = BorderRadius.circular(10);

    final textField = TextField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        border: InputBorder.none,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          color: const Color(0xFF000000).withValues(alpha: 0.3),
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontFamily: 'PingFang SC',
        ),
      ),
    );

    return Container(
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        color: Color(0XFFDDDDDD),
        borderRadius: borderRadius,
        border: Border.all(color: Colors.black, width: 2),
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(builder: (context, constraints) => Column(children: [
        Container(
          height: constraints.maxHeight - 4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius * 0.8,
          ),
          child: textField,
        )
      ],),),
    );
  }

  Widget _buildLoginButton({
    required BuildContext context,
    void Function()? onPressed,
    EdgeInsetsGeometry? margin,
    double? height,
  }) {
    final borderRadius = BorderRadius.circular(10);

    final body = Container(
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        color: Color(0XFF63A56F),
        borderRadius: borderRadius,
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 2),
          ),
        ]
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(builder: (context, constraints) => Stack(alignment: AlignmentDirectional.topCenter, children: [
        Container(
          height: constraints.maxHeight - 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0XFF77FE81), Color(0XFF7CEE63)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: borderRadius * 0.8,
          ),
          child: SingleChildScrollView(padding: EdgeInsets.fromLTRB(4, 4, 4, 0), child: Container(
            alignment: Alignment.topLeft,
            width: constraints.maxWidth,
            height: (constraints.maxHeight - 4) / 2,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.4),
              borderRadius: BorderRadius.only(
                topLeft: borderRadius.copyWith().topLeft,
                topRight: borderRadius.copyWith().topRight,
              ),
              shape: BoxShape.rectangle
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),),
          // child: textField,
        ),
        Positioned.fill(child: Center(child: MyStrokeText(
          text: '登录',
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
        )))
      ],),),
    );

    return TextButton(onPressed: onPressed, style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      minimumSize: WidgetStateProperty.all(Size.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ), child: body,);
  }

  Widget _buildButton({
    required BuildContext context,
    void Function()? onPressed,
    EdgeInsetsGeometry? margin,
    double? height,
    Widget? child,
  }) {
    final borderRadius = BorderRadius.circular(10);

    final body = Container(
      margin: margin,
      height: height,
      decoration: BoxDecoration(
          color: Color(0XFFDDDDDD),
          borderRadius: borderRadius,
          border: Border.all(color: Colors.black, width: 2),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black,
          //     offset: Offset(0, 2),
          //   ),
          // ]
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(builder: (context, constraints) => Stack(alignment: AlignmentDirectional.topCenter, children: [
        Container(
          height: constraints.maxHeight - 4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius * 0.8,
          ),
          child: SingleChildScrollView(padding: EdgeInsets.fromLTRB(4, 4, 4, 0), child: Container(
            alignment: Alignment.topLeft,
            width: constraints.maxWidth,
            height: (constraints.maxHeight - 4) / 2,
            decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.4),
                borderRadius: BorderRadius.only(
                  topLeft: borderRadius.copyWith().topLeft,
                  topRight: borderRadius.copyWith().topRight,
                ),
                shape: BoxShape.rectangle
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),),
          // child: textField,
        ),
        Positioned.fill(child: Center(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: child))),
      ],),),
    );

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: body,
    );
  }
}
