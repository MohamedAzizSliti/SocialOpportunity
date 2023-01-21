import 'package:flutter/material.dart';
import 'package:frontend/API/Opportunity_api.dart';
import 'package:frontend/Models/Opportunity_model.dart';
import 'package:frontend/components/OpportunityView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<List<OpportunityModel>>? _opportunityModel;

class _HomeScreenState extends State<HomeScreen> {
  // Initial Selected Value
  String dropdownvalue = 'Category';

  // List of items in our dropdown menu
  var items = [
    'Category',
    'Employment',
    'Leisure activities',
    'Community involvement',
  ];

  @override
  void initState() {
    super.initState();

    _opportunityModel = OpportunityApi().getAllOpportunity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Social Opportunity"),
        backgroundColor: Color(0xff34b7b1),
      ),
      body: Column(
        children: [
          DropdownButton(
            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
                _opportunityModel = OpportunityApi().filter(newValue);
              });
            },
          ),
          FutureBuilder<List<OpportunityModel>>(
            future: _opportunityModel,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                final List<OpportunityModel> data = snapshot.data;
                return ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return OpportunityView(
                        Opportunity: data[index],
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
