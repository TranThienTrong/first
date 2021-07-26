import 'dart:io';

class MyLocation{
  final double latitude;
  final double longitude;
  final String address;


  const MyLocation(this.latitude, this.longitude, {this.address = ''});

}

class Place{
  final String id;
  final String title;
  MyLocation? location;
  final File image;

  Place({required this.id, required this.title, required this.location,required this.image});


  @override
  String toString() {

    return '{ id: ${id}, title: ${title}, image: ${image}, location:${location} }';
  }
}


