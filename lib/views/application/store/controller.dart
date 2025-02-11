import 'package:get/get.dart';
import 'package:king_game/common/common.dart';

import 'state.dart';

class StoreController extends GetxController {
  final state = StoreState();

  @override
  void onReady() async {
    super.onReady();
    
    await getSkins();
  }

  Future<void> getSkins() async {
    await state.skins.value.update(
      language: UserController.to.localeString,
    );
    state.skins.refresh();
  }
}
