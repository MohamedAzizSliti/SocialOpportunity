import 'dart:async';

import 'package:frontend/DB/repository.dart';
import 'package:frontend/Models/Opportunity_model.dart';

class OpportunityService {
  late Repository _repository;
  OpportunityService() {
    _repository = Repository();
  }
  //Save Opportunity
  SaveOpportunity(OpportunityModel opportunity) async {
    return await _repository.insertData('Favorite', opportunity.toMap());
  }

  //Read All Opportunitys
  readAllOpportunitys() async {
    return await _repository.readData('Favorite');
  }

  //Edit Opportunity
  UpdateOpportunity(OpportunityModel opportunity) async {
    return await _repository.updateData('Favorite', opportunity.toMap());
  }

  deleteOpportunity(opportunityId) async {
    return await _repository.deleteDataById('Favorite', opportunityId);
  }
}
