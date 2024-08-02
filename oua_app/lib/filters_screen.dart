import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map<String, bool> filters = {
    'CCTV': false,
    'Covered Parking': false,
    'Securely gated': false,
    'Securely guard': false,
    'Flexible parking': false,
    'Size Restrictions': false,
  };

  void _applyFilters() {
    Navigator.pop(context, filters);
  }

  void _clearFilters() {
    setState(() {
      filters.updateAll((key, value) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: _clearFilters,
            child: Text('Clear', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: filters.keys.map((key) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    child: CheckboxListTile(
                      title: Text(key),
                      subtitle: Text(_getSubtitle(key)),
                      value: filters[key],
                      onChanged: (value) {
                        setState(() {
                          filters[key] = value ?? false;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _applyFilters,
              child: Text('Apply',style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSubtitle(String filter) {
    switch (filter) {
      case 'CCTV':
        return 'On-site surveillance';
      case 'Covered Parking':
        return 'Covered structure';
      case 'Securely gated':
        return 'Gated access';
      case 'Securely guard':
        return 'On-site security';
      case 'Flexible parking':
        return 'Daily rates';
      case 'Size Restrictions':
        return 'Oversized vehicle parking';
      default:
        return '';
    }
  }
}
