import 'bus.dart';
import 'schedule.dart';
import 'timings.dart';
import 'package:http/http.dart' as http;

class RemoteService
{
  Future<List<Bus>?> getBuses() async
  {
    var client = http.Client();

    var uri = Uri.parse('http://127.0.0.1:8000/api/bus?format=json');
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      return busFromJson(json);
    }
    return null;
  }

  Future<List<Schedule>?> getSchedule(routeNumber) async
  {
    var client = http.Client();

    var uri = Uri.parse('http://127.0.0.1:8000/api/schedule/$routeNumber?format=json');
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      return scheduleFromJson(json);
    }
    return null;
  }

  Future<List<Timings>?> getTiming(routeNumber) async
  {
    var client = http.Client();

    var uri = Uri.parse('http://127.0.0.1:8000/api/route/$routeNumber?format=json');
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      return routeFromJson(json);
    }
    return null;
  }
}