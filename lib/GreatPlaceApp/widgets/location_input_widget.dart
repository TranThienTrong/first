import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:projects/GreatPlaceApp/models/place.dart';
import 'package:projects/GreatPlaceApp/screens/map_screen.dart';
import 'package:projects/GreatPlaceApp/widgets/location_helper.dart';

class LocationInputWidget extends StatefulWidget {
  final void Function(double lat, double long) pickAddress;

  const LocationInputWidget(this.pickAddress);

  @override
  _LocationInputWidgetState createState() => _LocationInputWidgetState();
}

class _LocationInputWidgetState extends State<LocationInputWidget> {
  String? currentImageUrl;
  MyLocation? myLocation;

  void getCurrentLocation() async {
    try {
      LocationData location = await Location().getLocation();
      myLocation = MyLocation(location.latitude!, location.longitude!);
      widget.pickAddress(location.latitude!, location.longitude!);
      print(location.latitude);
      print(location.longitude);
      currentImageUrl = LocationHelper.setMapLocation(
          latitude: location.latitude, longitude: location.longitude);
      print(currentImageUrl);
      setState(() {});
    } catch (e) {
      print(e.toString() + 'Cannot Get Location');
      return;
    }
  }

  Future<void> selectLocationOnMap() async {
    if (myLocation == null) {
      LocationData location = await Location().getLocation();
      myLocation = MyLocation(location.latitude!, location.longitude!);
    }

    LatLng? selectedLocation = await Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (context) =>
                MapScreen(location: myLocation!, isSelectMode: true)))
        .then((result) => result);
    if (selectedLocation == null) {
      return;
    } else {
      setState(() {
        currentImageUrl = LocationHelper.setMapLocation(
            latitude: selectedLocation.latitude,
            longitude: selectedLocation.longitude);
      });

      widget.pickAddress(selectedLocation.latitude, selectedLocation.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            height: 200,
            alignment: Alignment.center,
            width: double.infinity,
            child: currentImageUrl == null
                ? Text('No location')
                : Image.network(currentImageUrl!,
                    fit: BoxFit.contain, width: double.infinity),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                  onPressed: getCurrentLocation,
                  icon: Icon(Icons.location_on),
                  label: Text('Location')),
              ElevatedButton.icon(
                  onPressed: selectLocationOnMap,
                  icon: Icon(Icons.map),
                  label: Text('Open Map')),
            ],
          )
        ],
      ),
    );
  }
}
