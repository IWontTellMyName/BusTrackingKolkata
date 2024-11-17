import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'bus.dart';
import 'remote_service.dart';
import 'schedule_view.dart';

/// Displays a list of SampleItems.
class BusListView extends StatefulWidget
{
  const BusListView({
    super.key,
    //this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });
  
  static const routeName = '/';

  @override
  State<BusListView> createState() => _BusListViewState();
}

class _BusListViewState extends State<BusListView>
{

  static const routeName = '/';

  List<Bus>? buses_list, buses_display_list;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    buses_list = await RemoteService().getBuses();
    buses_display_list = List.from(buses_list!);
    if(buses_list != null)
    {
      setState(() {
        isLoaded = true;
      });
    }
  }


  void updateList(String searchTerm)
  {
    setState(() {
      buses_display_list = buses_list!.where((bus) => bus.number.contains(searchTerm.toUpperCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Colors.deepPurple, Colors.purple.shade300],
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //     ),
        //   ),
        // ),
        title: TextField(
          onChanged: (searchTerm) => updateList(searchTerm),
          //controller: _searchController,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Select or Search a route',
            hintStyle: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: buses_display_list?.length,
        itemBuilder: (BuildContext context, int index) {
          
          return ListTile(
            title: Text(buses_display_list![index].number),
            leading: const CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SchedulesView(bus: buses_display_list![index]),));
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
