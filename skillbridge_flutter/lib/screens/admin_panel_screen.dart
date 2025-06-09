import 'package:flutter/material.dart';

class AdminPanelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mock admin controls and analytics
    return Scaffold(
      appBar: AppBar(title: Text('Admin Panel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Admin Controls', style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Approve Applications'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Manage Opportunities'),
            ),
            SizedBox(height: 30),
            Text('Analytics', style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.people),
                SizedBox(width: 8),
                Text('Total Users: 42'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.work),
                SizedBox(width: 8),
                Text('Active Opportunities: 7'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
