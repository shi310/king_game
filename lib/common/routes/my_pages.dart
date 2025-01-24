import 'package:get/get.dart';
import 'package:king_game/common/common.dart';
import 'package:king_game/views/views.dart';

class MyPages {
  // 未知页面
  static final unknownRoute = GetPage(
    name: MyRoutes.unknownView,
    page: () => const UnknownView(),
    binding: UnknownBinding(),
  );

  static final List<GetPage> getPages = [
    // 初始页面
    GetPage(
      name: MyRoutes.indexView,
      page: () => const IndexView(),
      binding: IndexBinding(),
      middlewares: [
        MiddlewareIndex(),
      ],
    ),

    // 登陆页面
    GetPage(
      name: MyRoutes.loginView,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),

    // Application 主页面
    GetPage(
      name: MyRoutes.applicationView,
      page: () => const ApplicationView(),
      binding: ApplicationBinding(),
    ),
  ];
}
