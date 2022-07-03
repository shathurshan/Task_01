// To parse this JSON data, do
//
// final welcome = welcomeFromJson(jsonString);
import 'dart:convert';

Suppliers suppliersFromJson(String str) => Suppliers.fromJson(json.decode(str));

String suppliersToJson(Suppliers data) => json.encode(data.toJson());

class Suppliers {
  Suppliers({
    required this.success,
    required this.message,
    required this.name,
    required this.result,
  });

  bool? success;
  String? message;
  String? name;
  List<Results> result;

  factory Suppliers.fromJson(Map<String, dynamic> json) => Suppliers(
        success: json["success"],
        message: json["message"],
        name: json["name"],
        result:
            List<Results>.from(json["result"].map((x) => Results.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "name": name,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Results {
  Results({
    required this.id,
    required this.supplier_name,
    required this.Addressline1,
    required this.Addressline2,
    required this.CityTown,
    required this.PostalCode,
  });

  int? id;
  String? supplier_name;
  String? Addressline1;
  String? Addressline2;
  String? CityTown;
  String? PostalCode;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        supplier_name: json["supplier_name"],
        Addressline1: json["Addressline1"],
        Addressline2: json["Addressline2"],
        CityTown: json["CityTown"],
        PostalCode: json["PostalCode"],
      );
  Map<String, dynamic> toJson() => {
        "author": id,
        "title": supplier_name,
        "description": Addressline1,
        "url": Addressline2,
        "urlToImage": CityTown,
        "publishedAt": PostalCode,
      };
}
