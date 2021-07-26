import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projects/GreatPlaceApp/models/place.dart';
import 'package:projects/GreatPlaceApp/providers/place_provider.dart';
import 'package:projects/GreatPlaceApp/widgets/image_input_widget.dart';
import 'package:projects/GreatPlaceApp/widgets/location_input_widget.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  var titleController = TextEditingController();

  File? _pickedImage;
  MyLocation? _pickedAddress;

  Future<void> pickImage(File pickedImage) async {
    this._pickedImage = pickedImage;
  }

  void pickAddress(double lat, double long) async {
    this._pickedAddress= MyLocation(lat,long);
  }

  void savePlace() {
    if (titleController.text == null || _pickedImage == null || _pickedAddress == null) {
      return;
    }

    Provider.of<PlaceProvider>(context, listen: false)
        .addPlace(titleController.text.toString(), _pickedImage!, _pickedAddress!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
        actions: [],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 0),
          margin: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(labelText: 'Title'),
                            controller: titleController,
                          ),
                          SizedBox(height: 10),
                          ImageInputWidget(onPickedImage: pickImage),
                        ],
                      ),
                    ),
                  )),
              Expanded(flex: 1, child: LocationInputWidget(pickAddress)),
              ElevatedButton.icon(
                onPressed: savePlace,
                label: Text('Add Place'),
                icon: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    minimumSize: Size(double.infinity, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
