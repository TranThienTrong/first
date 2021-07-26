import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/GreatPlaceApp/providers/place_provider.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatefulWidget {

  @override
  _PlacesListScreenState createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {

  @override
  void didChangeDependencies() {
    Provider.of<PlaceProvider>(context, listen: false).getAllPlacesFromDB();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places List'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('add_place_screen');
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<PlaceProvider>(
        builder: (context, placeProvider, child) => (Container(
            child: placeProvider.placesList.isEmpty
                ? child
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(placeProvider.placesList[index].image),
                        ),
                        title: Text(placeProvider.placesList[index].title),
                        subtitle: Text(placeProvider.placesList[index].location!.address, style: TextStyle(color: Colors.black),),
                        onTap: (){},
                      );
                    },
                    itemCount: placeProvider.placesList.length,
                  ))),
        child: Text('No item'),
      ),
    );
  }
}
