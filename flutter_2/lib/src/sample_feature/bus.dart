/// A placeholder class that represents an entity or model.

import 'dart:convert';

List<Bus> busFromJson(String str) => List<Bus>.from(json.decode(str).map((x) => Bus.fromJson(x)));

String busToJson(List<Bus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Bus {
  String number;

    Bus({
        required this.number,
    });

    factory Bus.fromJson(Map<String, dynamic> json) => Bus(
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
    };
}


