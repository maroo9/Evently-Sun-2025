import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class LocationTab extends StatefulWidget {
  const LocationTab({super.key});

  @override
  State<LocationTab> createState() => _LocationTabState();
}
class _LocationTabState extends State<LocationTab> {
  String? _style;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Loadmapstyle();


  }
  @override
  Widget build(BuildContext context) {

    return GoogleMap(initialCameraPosition: CameraPosition(target: LatLng( 30.04522432683500, 31.23117019007029,),
    zoom: 10,
    ),
mapType: MapType.hybrid,
    //  style: style,

    );
  }


  Future <void> Loadmapstyle()async{
    String style=await rootBundle.loadString('assets/maps_tyle/map_style.json');
    setState(() {
      _style=style;
    });


  }
}
