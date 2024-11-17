/// A placeholder class that represents an entity or model.

import 'dart:convert';
import 'package:duration/duration.dart';

List<Timings> routeFromJson(String str) => List<Timings>.from(json.decode(str).map((x) => Timings.fromJson(x)));

String routeToJson(List<Timings> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Timings {
    String bus, stoppage;
    int sequence;
    Duration prevStopTime, nextStopTime;

    Timings({
        required this.prevStopTime,
        required this.nextStopTime,
        required this.sequence,
        required this.bus,
        required this.stoppage,
    });

    factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        prevStopTime: parseTime("00:02:30"),//json["prev_stop_time"]),
        nextStopTime: parseTime("00:02:30"),//json["next_stop_time"]),
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