import 'package:flutter/material.dart';
import 'package:oua_app/edit_profile_screen.dart';
import 'package:oua_app/my_documents_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String name = 'Burak Başlık';
  final String email = 'burakbaslik@parkmaster.com';
  final String phoneNumber = '0 555 555 55 55';
  final List<Map<String, String>> cards = [
    {
      'bank': 'STATE BANK OF UK',
      'number': '1234',
      'type': 'Primary account',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/profil.jpg"),
                    radius: 30,
                  ),
                  title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(email),
                      Text(phoneNumber),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('BANK ACCOUNT & CARDS', style: TextStyle(fontWeight: FontWeight.bold)),
              ...cards.map((card) => Card(
                child: ListTile(
                  leading: Icon(Icons.account_balance, color: Colors.blue),
                  title: Text('${card['bank']}'),
                  subtitle: Text('${card['type']}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('...${card['number']}'),
                      InkWell(
                        onTap: () {
                        },
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              ListTile(
                leading: Icon(Icons.add_circle_outline, color: Colors.blue),
                title: Text('ADD BANK ACCOUNT'),
                onTap: () {
                },
              ),
              SizedBox(height: 20),
              Text('MY DOCUMENTS', style: TextStyle(fontWeight: FontWeight.bold)),
              ListTile(
                leading: Icon(Icons.folder, color: Colors.blue),
                title: Text('My Documents'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDocumentsScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Delete Account', style: TextStyle(color: Colors.red)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Logout',style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
