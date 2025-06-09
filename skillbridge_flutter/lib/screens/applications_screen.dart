import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/data_provider.dart';
import '../providers/auth_provider.dart';
import '../models/application.dart';

class ApplicationsScreen extends StatefulWidget {
  @override
  _ApplicationsScreenState createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() => _loading = true);
    final auth = Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<DataProvider>(context, listen: false)
        .fetchApplications(auth.user?.id ?? '', auth.user?.role ?? '');
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final applications = Provider.of<DataProvider>(context).applications;
    return Scaffold(
      appBar: AppBar(title: Text('Applications'), actions: [
        IconButton(icon: Icon(Icons.refresh), onPressed: _fetch),
      ]),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : applications.isEmpty
              ? Center(child: Text('No applications found.'))
              : ListView.builder(
                  itemCount: applications.length,
                  itemBuilder: (context, i) {
                    final a = applications[i];
                    return ListTile(
                      title: Text('Application #${a.id}'),
                      subtitle: Text('Status: ${a.status}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ApplicationDetailScreen(application: a),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
