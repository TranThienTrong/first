import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/Covid2019RESTfulAPI/api/covid_api.dart';
import 'package:projects/Covid2019RESTfulAPI/api/my_api_helper.dart';

class EndpointCard extends StatelessWidget {
  String data;
  final CovidAPIEndpoint endpoint;


  EndpointCard(this.endpoint,this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Case', style: Theme.of(context).textTheme.headline4),
            Text(data.toString(), style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
    );
  }
}
