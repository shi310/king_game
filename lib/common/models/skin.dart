import 'package:king_game/common/common.dart';

class SkinListModel {
  List<SkinModel> list;

  SkinListModel({required this.list});

  factory SkinListModel.fromJson(List<dynamic> json) => SkinListModel(
    list: List<SkinModel>.from(json.map((x) => SkinModel.fromJson(x))),
  );

  factory SkinListModel.empty() => SkinListModel(
    list: [],
  );

  Map<String, dynamic> toJson() => {
    'list': List<dynamic>.from(list.map((x) => x.toJson())),
  };

  Future<void> update({
    required String language,
  }) async {
    return UserController.to.myDio?.post<SkinListModel>(MyApi.user.listAllSkin,
      onSuccess: (code, msg, data) {
        list = data.list;
      },
      onError: (error) {
      },
      data: {
        "language": language,
      },
      onModel: (m) => SkinListModel.fromJson(m),
    );
  }
}

class SkinModel {
  int id;
  String createTime;
  String updateTime;
  int deleted;
  String type;
  String name;
  String url;
  String remark;
  int probability;
  int price;
  int winPrice;

  SkinModel({
    required this.id,
    required this.createTime,
    required this.updateTime,
    required this.deleted,
    required this.type,
    required this.name,
    required this.url,
    required this.remark,
    required this.probability,
    required this.price,
    required this.winPrice,
  });

  factory SkinModel.fromJson(Map<String, dynamic> json) => SkinModel(
    id: json["id"] ?? -1,
    createTime: json["createTime"] ?? '',
    updateTime: json["updateTime"] ?? '',
    deleted: json["deleted"] ?? -1,
    type: json["type"] ?? '',
    name: json["name"] ?? '',
    url: json["url"] ?? '',
    remark: json["remark"] ?? '',
    probability: json["probability"] ?? -1,
    price: json["price"] ?? -1,
    winPrice: json["winPrice"] ?? -1,
  );

  factory SkinModel.empty() => SkinModel(
    id: -1,
    createTime: '',
    updateTime: '',
    deleted: -1,
    type: '',
    name: '',
    url: '',
    remark: '',
    probability: -1,
    price: -1,
    winPrice: -1,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createTime": createTime,
    "updateTime": updateTime,
    "deleted": deleted,
    "type": type,
    "name": name,
    "url": url,
    "remark": remark,
    "probability": probability,
    "price": price,
    "winPrice": winPrice,
  };
}