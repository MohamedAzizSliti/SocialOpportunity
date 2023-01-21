import 'dart:convert';

import 'package:frontend/Models/Opportunity_model.dart';
import 'package:http/http.dart' as http;

class OpportunityApi {
  //Get All Social Opportunity
  Future<List<OpportunityModel>> getAllOpportunity() async {
    var url = "http://10.0.2.2:3000/api/socialopportunity";
    var respone = await http.get(Uri.parse(url));

    var responseBody = jsonDecode(respone.body);

    final List<OpportunityModel> Opportunitys = [];

    for (var art in responseBody) {
      Opportunitys.add(OpportunityModel.fromMap(art));
    }
    return Opportunitys;
  }

  Future<List<OpportunityModel>> filter(category) async {
    var url = "http://10.0.2.2:3000/api/socialopportunity";
    var respone = await http.get(Uri.parse(url));

    var responseBody = jsonDecode(respone.body);

    final List<OpportunityModel> Opportunitys = [];

    for (var art in responseBody) {
      if ("Category" == category)
        Opportunitys.add(OpportunityModel.fromMap(art));
      else if (art["Category"] == category) {
        Opportunitys.add(OpportunityModel.fromMap(art));
      }
    }
    return Opportunitys;
  }
}
