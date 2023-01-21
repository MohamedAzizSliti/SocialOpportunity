import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/Models/Opportunity_model.dart';
import 'package:frontend/SQL/opportunity_sql.dart';
import 'package:frontend/utils/app_layout.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class OpportunityView extends StatefulWidget {
  final OpportunityModel Opportunity;

  const OpportunityView({super.key, required this.Opportunity});

  @override
  State<OpportunityView> createState() => _OpportunityViewState();
}

class _OpportunityViewState extends State<OpportunityView> {
  bool _expanded = false;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xff34b7b1))),
      width: size.width * 0.40,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // ignore: prefer_const_constructors
        Row(
          children: [
            Text(
              widget.Opportunity.category,
              style: TextStyle(
                fontSize: 22,
                color: Color(0xff34b7b1),
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  OpportunitySQL().Favorite(widget.Opportunity, isFavorite);

                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 26,
                color: Colors.red,
              ),
            ),
            Gap(10)
          ],
        ),
        Row(
          children: [
            Text("Auther :",
                style: TextStyle(
                  fontSize: 16,
                )),
            const Gap(10),
            Text(
              widget.Opportunity.name,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        Text(
          DateFormat('yyyy-MM-dd hh:mm:ss').format(widget.Opportunity.date),
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Gap(20),
        Text(
          widget.Opportunity.description.length > 100
              ? _expanded
                  ? widget.Opportunity.description
                  : widget.Opportunity.description.substring(
                      0, min(105, widget.Opportunity.description.length))
              : widget.Opportunity.description,
          maxLines: _expanded ? 5 : 2,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        if (widget.Opportunity.description.length > 100)
          InkWell(
            child: Text(
              _expanded ? "Read Less" : "Read More",
              style: TextStyle(color: Colors.blueAccent),
            ),
            onTap: () {
              setState(() {
                _expanded = !_expanded;
                print(_expanded);
              });
            },
          )
      ]),
    );
  }
}
