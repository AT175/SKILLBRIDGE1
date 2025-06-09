import 'package:flutter/material.dart';
import '../models/opportunity.dart';

class OpportunityDetailScreen extends StatelessWidget {
  final Opportunity opportunity;
  OpportunityDetailScreen({required this.opportunity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(opportunity.title),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Organization: ${opportunity.organization}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(opportunity.description),
          ],
        ),
      ),
    );
  }
}
