import 'package:flutter/material.dart';
import '../models/application.dart';

class ApplicationDetailScreen extends StatelessWidget {
  final Application application;
  ApplicationDetailScreen({required this.application});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application #${application.id}'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Opportunity ID: ${application.opportunityId}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Status: ${application.status}'),
          ],
        ),
      ),
    );
  }
}
