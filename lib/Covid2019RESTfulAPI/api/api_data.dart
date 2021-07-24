import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:projects/Covid2019RESTfulAPI/api/my_api_helper.dart';
import 'package:projects/Covid2019RESTfulAPI/widgets/enpoint_card.dart';

import 'covid_api.dart';
import 'my_api_helper.dart';

class ApiData extends ChangeNotifier {
  final ApiHelper apiHelper;
  String? _accessToken;

  ApiData(this.apiHelper);

  Future<int?> getEndpointResource(CovidAPIEndpoint endpoint) async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiHelper.getAccessToken();
      }
      return (await apiHelper.getEndpointResource(_accessToken!, endpoint))
          as int;
    } on Response catch (responseCode) {
      if (responseCode == 401) {
        _accessToken = await apiHelper.getAccessToken();
        return (await apiHelper.getEndpointResource(_accessToken!, endpoint))
            as int;
      }
    }
  }

  Future<Map<CovidAPIEndpoint, String>> getAllEndpointResource() async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiHelper.getAccessToken();
      }

      List<String> result = await Future.wait([
        apiHelper.getEndpointResource(_accessToken!, CovidAPIEndpoint.cases),
        apiHelper.getEndpointResource(
            _accessToken!, CovidAPIEndpoint.casesSuspected),
        apiHelper.getEndpointResource(
            _accessToken!, CovidAPIEndpoint.casesConfirmed),
        apiHelper.getEndpointResource(_accessToken!, CovidAPIEndpoint.deaths),
        apiHelper.getEndpointResource(_accessToken!, CovidAPIEndpoint.recovered)
      ]);

      Map<CovidAPIEndpoint, String> resultMap = {
        CovidAPIEndpoint.cases: result[0],
        CovidAPIEndpoint.casesSuspected: result[1],
        CovidAPIEndpoint.casesConfirmed: result[2],
        CovidAPIEndpoint.deaths: result[3],
        CovidAPIEndpoint.recovered: result[4]
      };
      return resultMap;
    } on Response catch (responseCode) {
      if (responseCode == 401) {
        List result = await Future.wait([
          apiHelper.getEndpointResource(_accessToken!, CovidAPIEndpoint.cases),
          apiHelper.getEndpointResource(
              _accessToken!, CovidAPIEndpoint.casesSuspected),
          apiHelper.getEndpointResource(
              _accessToken!, CovidAPIEndpoint.casesConfirmed),
          apiHelper.getEndpointResource(_accessToken!, CovidAPIEndpoint.deaths),
          apiHelper.getEndpointResource(
              _accessToken!, CovidAPIEndpoint.recovered)
        ]);

        Map<CovidAPIEndpoint, String> resultMap = {
          CovidAPIEndpoint.cases: result[0],
          CovidAPIEndpoint.casesSuspected: result[1],
          CovidAPIEndpoint.casesConfirmed: result[2],
          CovidAPIEndpoint.deaths: result[3],
          CovidAPIEndpoint.recovered: result[4]
        };
        return resultMap;
      }
      rethrow;
    }
  }
}
