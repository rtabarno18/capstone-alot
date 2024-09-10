import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController {
  late GoogleMapController _controller;
  final LatLng _center =
      const LatLng(45.521563, -122.677433); // Default location

  void onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  LatLng get center => _center;

  void moveToLocation(LatLng location) {
    _controller.animateCamera(CameraUpdate.newLatLng(location));
  }
}
