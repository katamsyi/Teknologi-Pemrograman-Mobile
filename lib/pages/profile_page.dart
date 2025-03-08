import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final String fullName;
  final String nim;
  final String workExp;
  final String orgExp;
  final String hardSkill;
  final String softSkill;
  final String achievement;

  ProfilePage({
    required this.fullName,
    required this.nim,
    required this.workExp,
    required this.orgExp,
    required this.hardSkill,
    required this.softSkill,
    required this.achievement,
  });

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: const Color.fromARGB(255, 182, 248, 188),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            _buildProfileCard('Nama', fullName),
            _buildProfileCard('NIM', nim),
            _buildProfileCard('Pengalaman Kerja', workExp),
            _buildProfileCard('Pengalaman Organisasi', orgExp),
            _buildProfileCard('Hard Skill', hardSkill),
            _buildProfileCard('Soft Skill', softSkill),
            _buildProfileCard('Pencapaian', achievement),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _logout(context),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        color: const Color.fromARGB(255, 182, 248, 188),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(value,
                  style: TextStyle(fontSize: 16, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}
