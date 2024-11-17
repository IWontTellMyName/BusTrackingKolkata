/// A placeholder class that represents an entity or model.

import 'dart:convert';

List<Timings> routeFromJson(String str) => List<Timings>.from(json.decode(str).map((x) => Timings.fromJson(x)));

String routeToJson(List<Timings> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Timings {
    String prevStopTime, nextStopTime, bus, stoppage;
    int sequence;

    Timings({
        required this.prevStopTime,
        required this.nextStopTime,
        required this.sequence,
        required this.bus,
        required this.stoppage,
    });

    factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        prevStopTime: json["prev_stop_time"],
        nextStopTime: json["next_stop_time"],
        sequence: json["sequence"],
        bus: json["bus"],
        stoppage: json["stoppage"],
    );

    Map<String, dynamic> toJson() => {
        "prev_stop_time": prevStopTime,
        "next_stop_time": nextStopTime,
        "sequence": sequence,
        "bus": bus,
        "stoppage": stoppage,
    };
}