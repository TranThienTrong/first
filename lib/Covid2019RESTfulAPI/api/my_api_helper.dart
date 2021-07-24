import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projects/Covid2019RESTfulAPI/api/covid_api.dart';


class ApiHelper {

  final CovidAPI api = CovidAPI();


  Future<String> getAccessToken() async {
    String accessToken = '';
    http.Response response = await http.post(
        api.getUri(),
        headers: {'Authorization': 'Basic ${api.apiKey}'});

    if(response.statusCode == 200){
      Map responseBody = json.decode(response.body);
      accessToken = responseBody['access_token'];
      if(accessToken!=null){
        print(accessToken);
        return accessToken;
      }
    }
    throw response;
  }


  Future<String> getEndpointResource(String accessToken, CovidAPIEndpoint endpoint ) async{
      final endpointUri = api.getEndpointUri(endpoint);
      final response = await http.get(endpointUri, headers: {'Authorization': 'Bearer ${accessToken}'});

      if(response.statusCode == 200){
        List responseBody = json.decode(response.body);
        String result;
        if(!responseBody.isEmpty){
          switch (endpoint) {
            case CovidAPIEndpoint.cases:
              result = responseBody[0]['cases'].toString();
              break;
            case CovidAPIEndpoint.casesSuspected:
              result = responseBody[0]['data'].toString();
              break;
            case CovidAPIEndpoint.casesConfirmed:
              result = responseBody[0]['data'].toString();
              break;
            case CovidAPIEndpoint.deaths:
              result = responseBody[0]['data'].toString();
              break;
            case CovidAPIEndpoint.recovered:
              result = responseBody[0]['data'].toString();
              break;
            default:
              result = '';
          }

          return result;
        }
      }
      throw Exception('Cannot find resource');
  }

}
