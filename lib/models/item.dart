// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Model model;
  int pk;
  Fields fields;

  Item({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    model: modelValues.map[json["model"]]!,
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse[model],
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  String name;
  String type;
  int atk;
  String rarity;
  String description;
  int amount;
  int user;

  Fields({
    required this.name,
    required this.type,
    required this.atk,
    required this.rarity,
    required this.description,
    required this.amount,
    required this.user,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    name: json["name"],
    type: json["type"],
    atk: json["atk"],
    rarity: json["rarity"],
    description: json["description"],
    amount: json["amount"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "atk": atk,
    "rarity": rarity,
    "description": description,
    "amount": amount,
    "user": user,
  };
}

enum Model {
  MAIN_ITEM
}

final modelValues = EnumValues({
  "main.item": Model.MAIN_ITEM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
