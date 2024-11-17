import 'package:flutter/material.dart';
import 'package:flutter_2/src/sample_feature/schedule.dart';
import 'package:flutter_2/src/sample_feature/timings_view.dart';
import 'bus.dart';
import 'remote_service.dart';
//import 'schedule_view.dart';


/// Displays detailed information about a SampleItem.
class SchedulesView extends StatefulWidget {
  final Bus bus;

  const SchedulesView({super.key, required this.bus});

  @override
  State<SchedulesView> createState() => _SchedulesViewState();
}

class _SchedulesViewState extends State<SchedulesView> {
  
  List<Schedule>? schedule_list;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //fetch data from API
    getData();
  }

  getData() async {
    schedule_list = await RemoteService().getSchedule('${widget.bus.number}');
    if(schedule_list != null)
    {
      setState(() {
        isLoaded = true;
      });
    }
  }

  //Bus? bus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.bus.number}'),
      ),
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: schedule_list?.length,
        itemBuilder: (BuildContext context, int index) {
          
          return ListTile(
            title: Text(schedule_list![index].startTime +" "+
              (schedule_list![index].specialNote ?? (schedule_list![index].reverseDirection ? "Up" : "Down"))),
            subtitle: Text(schedule_list![index].daysOfWeek.toString()),
            leading: const CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TimingsView(schedule: schedule_list![index])));
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              // Navigator.restorablePushNamed(
              //   context,
              //   ScheduleView(bus: buses_display_list[index],),
              //);
            }
          );
        },
      ),
    );
  }
}

