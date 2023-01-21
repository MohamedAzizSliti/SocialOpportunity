// To parse this JSON data, do
//
//     final opportunityModel = opportunityModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<OpportunityModel> opportunityModelFromMap(String str) => List<OpportunityModel>.from(json.decode(str).map((x) => OpportunityModel.fromMap(x)));

String opportunityModelToMap(List<OpportunityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class OpportunityModel {
    OpportunityModel({
        required this.idopportunity,
        required this.name,
        required this.description,
        required this.category,
        required this.date,
        required this.address,
    });

    int idopportunity;
    String name;
    String description;
    String category;
    DateTime date;
    String address;

    factory OpportunityModel.fromMap(Map<String, dynamic> json) => OpportunityModel(
        idopportunity: json["idopportunity"],
        name: json["Name"],
        description: json["Description"],
        category: json["Category"],
        date: DateTime.parse(json["Date"]),
        address: json["Address"],
    );

    Map<String, dynamic> toMap() => {
        "idopportunity": idopportunity,
        "Name": name,
        "Description": description,
        "Category": category,
        "Date": date.toIso8601String(),
        "Address": address,
    };
}
