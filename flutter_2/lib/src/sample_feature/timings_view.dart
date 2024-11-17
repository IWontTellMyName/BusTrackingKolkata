import 'package:flutter/material.dart';
import 'package:flutter_2/src/sample_feature/schedule.dart';
import 'schedule.dart';
import 'timings.dart';
import 'remote_service.dart';


/// Displays detailed information about a SampleItem.
class TimingsView extends StatefulWidget {
  Schedule schedule;
  TimingsView({super.key, required this.schedule});

  @override
  State<TimingsView> createState() => _TimingsViewState();
}

class _TimingsViewState extends State<TimingsView> {
  
  List<Timings>? timing_list;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //fetch data from API
    getData();
  }

  getData() async {
    timing_list = await RemoteService().getTiming('${widget.schedule.bus}');
    if(timing_list != null)
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
        title: Text('${widget.schedule.startTime} ${widget.schedule.bus}'),
      ),
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: timing_list?.length,
        itemBuilder: (BuildContext context, int index) {
          
          return ListTile(
            title: Text(timing_list![index].stoppage),
            subtitle: Text(timing_list![index].prevStopTime.toString()),
            leading: const CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            // onTap: () {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => SchedulesView(bus: schedule_list![index]),));
            //   // Navigate to the details page. If the user leaves and returns to
            //   // the app after it has been killed while running in the
            //   // background, the navigation stack is restored.
            //   // Navigator.restorablePushNamed(
            //   //   context,
            //   //   ScheduleView(bus: buses_display_list[index],),
            //   //);
            // }
          );
        },
      ),
    );
  }
}
