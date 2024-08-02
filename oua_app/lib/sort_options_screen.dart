import 'package:flutter/material.dart';

class SortOptionsScreen extends StatefulWidget {
  final Function(String) onSortSelected;
  final Function(double) onDistanceChanged;

  SortOptionsScreen({required this.onSortSelected, required this.onDistanceChanged});

  @override
  _SortOptionsScreenState createState() => _SortOptionsScreenState();
}

class _SortOptionsScreenState extends State<SortOptionsScreen> {
  double _currentDistance = 1.0;
  String? _selectedSortOption;
  bool _favouritesSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sort Options'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Distance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Slider(
              value: _currentDistance,
              min: 0,
              max: 5,
              divisions: 5,
              label: '${_currentDistance.toStringAsFixed(1)} km',
              onChanged: (double value) {
                setState(() {
                  _currentDistance = value;
                });
                widget.onDistanceChanged(value);
              },
            ),
            SizedBox(height: 1),
            CheckboxListTile(
              title: Text('My Favourites'),
              value: _favouritesSelected,
              onChanged: (bool? value) {
                setState(() {
                  _favouritesSelected = value ?? false;
                  _selectedSortOption = null;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Top rated'),
              value: _selectedSortOption == 'top_rated',
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedSortOption = 'top_rated';
                    _favouritesSelected = false;
                  } else {
                    _selectedSortOption = null;
                  }
                });
                widget.onSortSelected('top_rated');
              },
            ),
            CheckboxListTile(
              title: Text('Low to high price'),
              value: _selectedSortOption == 'low_to_high_price',
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedSortOption = 'low_to_high_price';
                    _favouritesSelected = false;
                  } else {
                    _selectedSortOption = null;
                  }
                });
                widget.onSortSelected('low_to_high_price');
              },
            ),
            CheckboxListTile(
              title: Text('High to low price'),
              value: _selectedSortOption == 'high_to_low_price',
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedSortOption = 'high_to_low_price';
                    _favouritesSelected = false;
                  } else {
                    _selectedSortOption = null;
                  }
                });
                widget.onSortSelected('high_to_low_price');
              },
            ),
          ],
        ),
      ),
    );
  }
}
