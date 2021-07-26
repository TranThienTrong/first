import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projects/GreatPlaceApp/models/place.dart';

class MapScreen extends StatefulWidget {
  final MyLocation location;
  final bool isSelectMode;

  MapScreen(
      {this.location = const MyLocation(10, 10), this.isSelectMode = false});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedLocation;

  void selectLocation(LatLng location) {
    setState(() {
      _selectedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        actions: [
          if (widget.isSelectMode)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _selectedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_selectedLocation!);
                    },
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.latitude, widget.location.longitude),
          zoom: 16,
        ),
        onTap: widget.isSelectMode == true ? selectLocation : null,
        markers: _selectedLocation != null
            ? {
                Marker(markerId: MarkerId('mk1'), position: _selectedLocation!),
              }
            : {
                Marker(
                    markerId: MarkerId('mk0'),
                    position: LatLng(
                        widget.location.latitude, widget.location.longitude)),
              },
      ),
    );
  }
}
