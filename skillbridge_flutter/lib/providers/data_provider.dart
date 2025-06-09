import 'package:flutter/material.dart';

import '../models/opportunity.dart';
import '../models/application.dart';
import '../services/api_service.dart';

class DataProvider extends ChangeNotifier {
  List<Opportunity> _opportunities = [];
  List<Application> _applications = [];

  List<Opportunity> get opportunities => _opportunities;
  List<Application> get applications => _applications;

  Future<void> fetchOpportunities() async {
    final data = await ApiService.fetchOpportunities();
    _opportunities = data.map((json) => Opportunity.fromJson(json)).toList();
    notifyListeners();
  }

  Future<void> fetchApplications(String userId, String role) async {
    final data = await ApiService.fetchApplications(userId, role);
    _applications = data.map((json) => Application.fromJson(json)).toList();
    notifyListeners();
  }
}
