import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/data_provider.dart';
import '../models/opportunity.dart';

class OpportunitiesScreen extends StatefulWidget {
  @override
  _OpportunitiesScreenState createState() => _OpportunitiesScreenState();
}

class _OpportunitiesScreenState extends State<OpportunitiesScreen> {
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() => _loading = true);
    await Provider.of<DataProvider>(context, listen: false).fetchOpportunities();
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final opportunities = Provider.of<DataProvider>(context).opportunities;
    return Scaffold(
      appBar: AppBar(title: Text('Opportunities'), actions: [
        IconButton(icon: Icon(Icons.refresh), onPressed: _fetch),
      ]),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : opportunities.isEmpty
              ? Center(child: Text('No opportunities found.'))
              : ListView.builder(
                  itemCount: opportunities.length,
                  itemBuilder: (context, i) {
                    final o = opportunities[i];
                    return ListTile(
                      title: Text(o.title),
                      subtitle: Text(o.organization),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OpportunityDetailScreen(opportunity: o),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
