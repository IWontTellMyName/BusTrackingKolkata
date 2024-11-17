/// A placeholder class that represents an entity or model.

import 'dart:convert';

List<Schedule> scheduleFromJson(String str) => List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

String scheduleToJson(List<Schedule> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Schedule {
  String bus, startTime;
  String? specialNote, daysOfWeek;
  //int daysOfWeek;
  bool reverseDirection;


    Schedule({
        required this.bus,
        required this.reverseDirection,
        required this.startTime,
        required this.specialNote,
        this.daysOfWeek = "M T W T F",
    });

    
    factory Schedule.fromJson(Map<String, dynamic> json)
    {
      Schedule object = Schedule(
        bus: json["bus"],
        reverseDirection: json["reverse_direction"],
        startTime: json["start_time"],
        specialNote: json["special_note"],
        //daysOfWeek: json["days_of_week"].toString()
        );

      bool pm = int.parse(object.startTime.substring(0,2)) >=12;
      object.startTime = object.startTime.replaceRange(5, 8, pm?" PM":" AM");
      
      if (json["days_of_week"] == 6)
        object.daysOfWeek = "M T W T F S";
      else if (json["days_of_week"] == 7)
        object.daysOfWeek = "M T W T F S S";

      return object;
    }
    


    // factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    //     route: json["bus"],
    //     reverseDirection: json["reverse_direction"],
    //     startTime: json["start_time"],
    //     specialNote: json["special_note"],
    //     daysOfWeek: json["days_of_week"],
    // );

    Map<String, dynamic> toJson() => {
        "bus": bus,
        "reverse_direction": reverseDirection,
        "start_time": startTime,
        "special_note": specialNote,
        "days_of_week": daysOfWeek,
    };
}


