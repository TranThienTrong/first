import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/Covid2019RESTfulAPI/api/api_data.dart';
import 'package:projects/Covid2019RESTfulAPI/api/covid_api.dart';
import 'package:projects/Covid2019RESTfulAPI/api/my_api_helper.dart';
import 'package:provider/provider.dart';

import 'enpoint_card.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  String _cases='';
  String _casesSuspected='';
  String _casesConfirmed='';
  String _deaths='';
  String _recovered='';


  @override
  void initState(){
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    ApiData apiData = Provider.of<ApiData>(context,listen: false);
    Map<CovidAPIEndpoint,String> resultMap = await apiData.getAllEndpointResource();
    setState(() {
      _cases = resultMap[CovidAPIEndpoint.cases]!;
      _casesSuspected = resultMap[CovidAPIEndpoint.casesSuspected]!;
      _casesConfirmed = resultMap[CovidAPIEndpoint.casesConfirmed]!;
      _deaths = resultMap[CovidAPIEndpoint.deaths ]!;
      _recovered = resultMap[CovidAPIEndpoint.recovered ]!;
    });

  }



  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(title: Text('Covid2019 REST API')),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: Container(
            child: ListView(children: <Widget>[
              EndpointCard(CovidAPIEndpoint.cases, _cases),
              EndpointCard(CovidAPIEndpoint.cases, _casesSuspected),
              EndpointCard(CovidAPIEndpoint.cases, _casesConfirmed),
              EndpointCard(CovidAPIEndpoint.cases, _deaths),
              EndpointCard(CovidAPIEndpoint.cases, _recovered),

        ],)),
      ));
  }
}
