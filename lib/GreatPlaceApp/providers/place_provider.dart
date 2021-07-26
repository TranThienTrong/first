import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:projects/GreatPlaceApp/database/db_helper.dart';
import 'package:projects/GreatPlaceApp/models/place.dart';
import 'package:projects/GreatPlaceApp/widgets/location_helper.dart';

class PlaceProvider with ChangeNotifier {
  List<Place> _placesList = [];

  List<Place> get placesList => _placesList;

  set placesList(List<Place> value) {
    this._placesList = value;
  }

  void addPlace(String title, File image, MyLocation myLocation) async {
    String? address = await LocationHelper.getAddress(
        myLocation.latitude, myLocation.longitude);
    myLocation = MyLocation(myLocation.latitude, myLocation.longitude,
        address: address!);
    Place place = Place(
        id: DateTime.now().toString(),
        image: image,
        title: title,
        location: myLocation);

    _placesList.add(place);
    await DBHelper.insert('Places', {
      'id': place.id,
      'title': place.title,
      'image': place.image.path,
      'location_latitude': myLocation.latitude,
      'location_longitude': myLocation.longitude,
      'address': address
    });
    notifyListeners();
  }

  Future<void> getAllPlacesFromDB() async {
    List<Map<String, Object?>> placesList =
        await DBHelper.getTableRecords('Places');
    placesList.forEach((row) {
      Place place = Place(
          id: row['id'].toString(),
          title: row['title'].toString(),
          image: File(row['image'].toString()),
          location: MyLocation(row['location_latitude'] as double,row['location_longitude'] as double, address: row['address'] as String));
      _placesList.add(place);
    });

    for (var a in _placesList) {
      print(a.toString());
    }
    notifyListeners();
  }
}
