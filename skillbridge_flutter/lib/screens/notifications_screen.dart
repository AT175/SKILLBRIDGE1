import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<String> mockNotifications = [
    'Welcome to SkillBridge!',
    'Your application has been received.',
    'New opportunity available.',
    'Admin has updated the dashboard.'
  ];

  @override
  Widget build(BuildContext context) {
    // Simulate loading
    bool isLoading = false; // Set to true to simulate loading state
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: mockNotifications.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.notifications),
                title: Text(mockNotifications[index]),
              ),
            ),
    );
  }
}
