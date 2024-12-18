import 'package:location/location.dart';

class GeoLocation {
  double? longitude;
  double? latitude;

  Future<void> getCurrentLocation() async {
    try {
      Location location = Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();
      longitude = _locationData.longitude;
      latitude = _locationData.latitude;
      // print(_locationData);
    } catch (e) {
      print(e);
    }
  }
}
