import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/scan_model.dart';


class MapaPage extends StatefulWidget {
   

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  Completer<GoogleMapController> _controller = Completer();

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
    target: scan.getLatLng(),
    zoom: 14.4746,
  );


    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: scan.getLatLng()
      ));


    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_disabled),
            onPressed: ()async{
               final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: scan.getLatLng(), zoom: 17)
    ));
            } )
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Container(
        
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          child: Icon(Icons.layers),
          backgroundColor: Colors.lightBlue,
           onPressed: () {

             if (mapType == MapType.normal){
               mapType = MapType.satellite;
             }else{

               mapType = MapType.normal;
             }

             setState(() {
               
             });

             },
        ),
      ),
    );
  }
}