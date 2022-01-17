import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Completer<GoogleMapController> _controller = Completer();

class mapview extends StatelessWidget {
  mapview(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //eixe container kai to ekana sizedbox
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: //evala const
            const CameraPosition(
                target: LatLng(35.143605, 33.391914), zoom: 14),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          SmartBin1,
          SmartBin2,
          SmartBin3,
          SmartBin4,
          SmartBin5,
          SmartBin6,
        },
      ),
    );
  }

  Marker SmartBin1 = Marker(
    markerId: const MarkerId('SmartBin1'), //evala const
    position: const LatLng(35.147375, 33.415861), //evala const
    infoWindow: const InfoWindow(title: 'SmartBin1'), //evala const
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
  );
  Marker SmartBin2 = Marker(
    markerId: const MarkerId('SmartBin2'),
    position: const LatLng(35.148241, 33.413619),
    infoWindow: const InfoWindow(title: 'SmartBin2'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );
  Marker SmartBin3 = Marker(
    markerId: const MarkerId('SmartBin3'),
    position: const LatLng(35.149066, 33.411666),
    infoWindow: const InfoWindow(title: 'SmartBin3'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );
  Marker SmartBin4 = Marker(
    markerId: const MarkerId('SmartBin4'),
    position: const LatLng(35.144258, 33.411934),
    infoWindow: const InfoWindow(title: 'SmartBin4'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );
  Marker SmartBin5 = Marker(
    markerId: const MarkerId('SmartBin5'),
    position: const LatLng(35.147864, 33.410067),
    infoWindow: const InfoWindow(title: 'SmartBin5'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );
  Marker SmartBin6 = Marker(
    markerId: const MarkerId('SmartBin6'),
    position: const LatLng(35.145627, 33.413672),
    infoWindow: const InfoWindow(title: 'SmartBin6'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );
} //END of class mapview

// GO TO LOCATION CLASS
class gotolocation extends StatelessWidget {
  const gotolocation(
    this.lat,
    this.long,
  );
  final double lat;
  final double long;

  @override
  Widget build(BuildContext context) {
    newlocation(lat, long);
    return Container();
  }

  Future<void> newlocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(lat, long), zoom: 15, tilt: 50.0, bearing: 45.0),
      ),
    );
  }
}
