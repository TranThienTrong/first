import 'package:projects/Covid2019RESTfulAPI/api/api_auth.dart';

enum CovidAPIEndpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered
}

class CovidAPI {
  String apiKey = APIAuthentication.APIKey;
  String host = 'ncov2019-admin.firebaseapp.com';

  CovidAPI();

  Uri getUri() {
    return Uri(scheme: 'https', host: host, path: 'token');
  }

  Uri getEndpointUri(CovidAPIEndpoint endpoint) {
    String uriEndpoint;
    switch (endpoint) {
      case CovidAPIEndpoint.cases:
        uriEndpoint = 'cases';
        break;
      case CovidAPIEndpoint.casesSuspected:
        uriEndpoint = 'casesSuspected';
        break;
      case CovidAPIEndpoint.casesConfirmed:
        uriEndpoint = 'casesConfirmed';
        break;
      case CovidAPIEndpoint.deaths:
        uriEndpoint = 'deaths';
        break;
      case CovidAPIEndpoint.recovered:
        uriEndpoint = 'recovered';
        break;
      default:
        uriEndpoint = '/';
    }

    return Uri(scheme: 'https', host: host, path: uriEndpoint);
  }
}
