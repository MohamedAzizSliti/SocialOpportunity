import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Models/Opportunity_model.dart';
import 'package:frontend/Server/Opportunity_service.dart';

class OpportunitySQL {
  Favorite(OpportunityModel opportunity, bool isFavorite) async {
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    if (!isFavorite) {
      await OpportunityService().SaveOpportunity(opportunity);
      Fluttertoast.showToast(msg: "Add it to favorite");
    } else {
      await OpportunityService().deleteOpportunity(opportunity.idopportunity);
      Fluttertoast.showToast(msg: "Romve it from favorite");
    }
  }
}
