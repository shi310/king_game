import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_game/common/common.dart';

void buildSignInDialog() {
  final signInData = SignInModel.empty().obs;

  signInData.value.update().then((value) {
    signInData.refresh();
  });

  showMyDialog(
      header: Row(children: [
        SizedBox(height: MyConfig.app.alertHeaderHeight / 2, child: MyIcons.signInTitle),
        SizedBox(width: 4,),
        MyStrokeText(
          text: Lang.signInAlertTitle.tr,
          strokeWidth: 4,
          dy: 3,
          fontSize: 20,
          fontFamily: 'Sans',
        ),
      ]),
      body: Container(
        color: Color(0xFF213F98),
        child: SingleChildScrollView(child: Column(children: [
          Obx(() => _buildSignInWin(signInData: signInData.value)),
          Obx(() => _buildCalendar(signInData: signInData.value)),
        ])),
      ),
      footer: Container(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Row(children: [
          Expanded(child: buildButton(
              onPressed: () => _onSignIn(signInData),
              height: 44,
              colors: [Color(0xFFFBAC17), Color(0xFFFBAC17)],
              shadowColor: Color(0xFF944600),
              child: Center(child: FittedBox(child: MyStrokeText(
                text: Lang.signIn.tr,
                strokeWidth: 4,
                dy: 3,
                fontFamily: 'Sans',
                fontSize: 13,
              )))
          )),
          SizedBox(width: 10),
          Expanded(child: buildButton(
              onPressed: () => _onSignInAgain(signInData),
              height: 44,
              colors: [Color(0xFFF96312), Color(0xFFF96312)],
              shadowColor: Color(0xFF944600),
              child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(height: 30, child: MyIcons.headerCard),
                Flexible(child: FittedBox(child: MyStrokeText(
                  text: '10 ${Lang.signInAgain.tr}',
                  strokeWidth: 4,
                  dy: 3,
                  fontFamily: 'Sans',
                  fontSize: 13,
                ))),
                SizedBox(width: 8),
              ]))
          )),
        ],),
      )
  );
}

Widget _buildSignInWin({
  required SignInModel signInData,
}) {
  final signInWinBox = Row(children: [
    Expanded(child: _buildSignInWinItem(index: '1', signInData: signInData)),
    SizedBox(width: 8),
    Expanded(child: _buildSignInWinItem(index: '7', signInData: signInData)),
    SizedBox(width: 8),
    Expanded(child: _buildSignInWinItem(index: '14', signInData: signInData)),
    SizedBox(width: 8),
    Expanded(child: _buildSignInWinItem(index: '21', signInData: signInData)),
    SizedBox(width: 8),
    Expanded(child: _buildSignInWinItem(index: '30', signInData: signInData)),
  ]);

  return Container(
      padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
      decoration: BoxDecoration(
        color: Color(0xFF64AAF1),
      ),
      child: Column(children: [
        Stack(children: [
          Opacity(opacity: 0, child: signInWinBox),
          Positioned.fill(child: LayoutBuilder(builder: (context, container) {
            DateTime now = DateTime.now();
            int totalDays = DateTime(now.year, now.month + 1, 0).day;
            final signInDays = now.day - 1 - signInData.omissions;
            return Align(alignment: Alignment.bottomCenter, child: Padding(padding: EdgeInsets.only(bottom: 20 + 10 + 6, left: container.maxWidth * 0.1, right: container.maxWidth * 0.1), child: Container(
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Align(alignment: Alignment.centerLeft, child: Container(
                width: container.maxWidth / totalDays * signInDays,
                color: Color(0xFF9EF9FC),
              ),),
            )));
          })),
          signInWinBox,
        ],),
        SizedBox(height: 16),
        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black,
          ),
          child: Center(child: FittedBox(child: Text(Lang.signInAlertMessage.tr, style: TextStyle(color: Colors.white, fontSize: 13)))),
        )
      ],)
  );
}

Widget _buildSignInWinItem({
  required String index,
  required SignInModel signInData,
}) {
  DateTime now = DateTime.now();
  int signInDays = 0;

  for (int i = 0; i <= now.day; i++) {
    if(signInData.signInTree['$i'] == 1) {
      signInDays++;
    }
  }

  return Column(children: [
    Stack(clipBehavior: Clip.none, children: [
      signInData.continuous[index] != 0
          ? MyIcons.signInNeverWinIcon
          : MyIcons.signInAlreadyWinIcon,
      Positioned.fill(left: 10, right: 10, top: 10, bottom: 20, child: Center(child: SizedBox(height: 60, child: Opacity(opacity: signInData.continuous[index] != 0 ? 0.5 : 1, child: MyIcons.signInWin(index))))),
      if (signInData.continuous[index] != 0)
        Positioned(right: -4, top: -4, child: Center(child: SizedBox(height: 24, child: MyIcons.langChecked)))
    ]),
    SizedBox(height: 10),
    int.parse(index) - signInDays > 0 && (int.parse(index) - signInDays <= 7 || (signInDays > 20 && int.parse(index) - signInDays <= 9))
        ? SizedBox(height: 24, child: MyIcons.signInWinDay)
        : SizedBox(height: 24, child: MyIcons.signInDay),
    SizedBox(height: 10),
    Container(
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: signInData.continuous[index] != 0
            ? Color(0xFF213F98)
            : Color(0xFFDB6900),
      ),
      child: Row(children: [
        SizedBox(width: 10),
        Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(width: 12, child: MyIcons.signInNote),
          Flexible(child: FittedBox(child: Center(child: Text('  $index${Lang.signInAlertDay.tr}', style: TextStyle(color: Colors.white, fontSize: 10)))))
        ])),
        SizedBox(width: 10),
      ]),
    ),
  ]);
}

Widget _buildCalendar({
  required SignInModel signInData,
}) {
  DateTime now = DateTime.now();

  int totalDays = DateTime(now.year, now.month + 1, 0).day;
  int firstWeekday = DateTime(now.year, now.month, 1).weekday;
  int startIndex = (firstWeekday % 7);
  List<Widget> days = List.generate(startIndex, (_) => const SizedBox());

  for (int i = 1; i <= totalDays; i++) {
    bool isToday = (i == now.day);
    days.add(
      Stack(children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF152966),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$i',
              style: TextStyle(
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                color: isToday ? Colors.amber : Colors.white,
              ),
            ),
          ),
        ),
        if (signInData.signInTree[i.toString()] != 0)
          Positioned.fill(child: Align(alignment: Alignment.topRight, child: SizedBox(height: 15, child: MyIcons.langChecked)))
      ]),
    );
  }

  return Padding(padding: EdgeInsets.all(10), child: Column(mainAxisSize: MainAxisSize.min, children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Lang.sunday.tr,
        Lang.monday.tr,
        Lang.tuesday.tr,
        Lang.wednesday.tr,
        Lang.thursday.tr,
        Lang.friday.tr,
        Lang.saturday.tr,
      ].map((e) => Expanded(child: Center(child: Text(e, style: TextStyle(color: Colors.white))))).toList(),
    ),
    const SizedBox(height: 10),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate((days.length / 7).ceil(), (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(7, (col) {
            int index = row * 7 + col;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.all(2),
                child: index < days.length ? days[index] : const SizedBox(),
              ),
            );
          }),
        );
      }),
    ),
    SizedBox(height: 20),
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: 16, child: MyIcons.signInMiss),
      SizedBox(width: 8),
      Text(Lang.signInAlertMissed.trArgs(['${signInData.omissions}']), style: TextStyle(color: Colors.white, fontSize: 12)),
    ]),
    SizedBox(height: MyConfig.app.alertFooterHeight),

  ],
  ));
}

Future<void> _onSignIn(Rx<SignInModel> signInData) async {
  showMyLoading();
  await UserController.to.myDio?.post(MyApi.signIn.signIn,
      onSuccess: (code, msg, data) async {
        await signInData.value.update();
        signInData.refresh();
        MyAlert.showSnack(child: Text(msg, style: TextStyle(color: Colors.white)));
      },
      onError: (error) {
        MyAlert.showSnack(child: Text(error.error.toString(), style: TextStyle(color: Colors.white)));
      }
  );
  hideMyLoading();
}

Future<void> _onSignInAgain(Rx<SignInModel> signInData) async {
  showMyLoading();
  await UserController.to.myDio?.post(MyApi.signIn.signInRepair,
      onSuccess: (code, msg, data) async {
        await signInData.value.update();
        signInData.refresh();
        MyAlert.showSnack(child: Text(msg, style: TextStyle(color: Colors.white)));
      },
      onError: (error) {
        MyAlert.showSnack(child: Text(error.error.toString(), style: TextStyle(color: Colors.white)));
      }
  );
  hideMyLoading();
}