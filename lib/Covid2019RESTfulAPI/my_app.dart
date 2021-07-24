import 'package:flutter/material.dart';
import 'package:projects/Covid2019RESTfulAPI/api/api_data.dart';
import 'package:projects/Covid2019RESTfulAPI/api/covid_api.dart';
import 'package:projects/Covid2019RESTfulAPI/widgets/dashboard.dart';
import 'package:provider/provider.dart';

import 'api/my_api_helper.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ApiHelper apiHelper = new ApiHelper();
  String _accessToken = '';
  int _cases = 0;
  int _deaths = 0;

  void generateAccessToken() async {
    final accessToken = await apiHelper.getAccessToken();
    var cases = await apiHelper.getEndpointResource(
        accessToken, CovidAPIEndpoint.cases);
    var deaths = await apiHelper.getEndpointResource(
        accessToken, CovidAPIEndpoint.deaths);
    setState(() {
      _accessToken = accessToken;
      _cases = cases as int;
      _deaths = deaths as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ApiData(ApiHelper())),
        ],
      child: Dashboard(),
    );
  }
}

void main() {
  runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF101010),
          cardColor: Color(0xFF222222)),
      home: MyApp()));
}
