
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LocationHelper{
  static String GOOGLE_MAP_API_KEY = 'AIzaSyAuMkOzgvRAUQphv7VucPIEkP5tGVr-hho';

  static String setMapLocation({double? latitude,double? longitude}){
      return 'https://maps.googleapis.com/maps/api/staticmap?center=&${latitude},${longitude}&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C${latitude},${longitude}&key=${GOOGLE_MAP_API_KEY}';
  }

  static Future<String?> getAddress(double latitude, double longitude) async{
      Uri url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=${latitude},${longitude}&key=${GOOGLE_MAP_API_KEY}');
      Response response = await http.get(url);
      String result;
      if(response.statusCode==200){
        result = json.decode(response.body)['results'][0]['formatted_address'];
        print(result);
        return result;
      }
      return null;
  }
}