import 'package:flutter/material.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String nickname;

  const HomePage({super.key, required this.username, required this.nickname});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController workExpController = TextEditingController();
  final TextEditingController orgExpController = TextEditingController();
  final TextEditingController hardSkillController = TextEditingController();
  final TextEditingController softSkillController = TextEditingController();
  final TextEditingController achievementController = TextEditingController();

  void _goToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          fullName: fullNameController.text,
          nim: nimController.text,
          workExp: workExpController.text,
          orgExp: orgExpController.text,
          hardSkill: hardSkillController.text,
          softSkill: softSkillController.text,
          achievement: achievementController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Selamat Datang ${widget.nickname.isNotEmpty ? widget.nickname : widget.username}'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            _buildTextField(fullNameController, 'Nama Lengkap'),
            _buildTextField(nimController, 'NIM'),
            _buildTextField(workExpController, 'Pengalaman Kerja'),
            _buildTextField(orgExpController, 'Pengalaman Organisasi'),
            _buildTextField(hardSkillController, 'Hard Skill'),
            _buildTextField(softSkillController, 'Soft Skill'),
            _buildTextField(achievementController, 'Pencapaian/Penghargaan'),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _goToProfile,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Lihat Profil',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        ),
      ),
    );
  }
}
