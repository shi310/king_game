import 'package:get/get.dart';

import 'state.dart';

class StoreController extends GetxController {
  final state = StoreState();

  @override
  void onReady() async {
    super.onReady();
    
    await state.skins.value.update(
      language: 'zh'
    );
  }
}
