import 'package:flutter/material.dart';
import 'update_profile_page.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController(text: 'Tomo');
  TextEditingController _dobController =
      TextEditingController(text: '27 April 1999');
  TextEditingController _emailController =
      TextEditingController(text: 'example@student.uir.ac.id');
  TextEditingController _phoneController =
      TextEditingController(text: '628974440281');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9F7FFF), Color(0xFF8055FE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 80), // Adjust according to your AppBar height
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/profile.jpg'), // Replace with your image asset
                ),
                SizedBox(height: 20),
                ProfileField(label: 'Nama', controller: _nameController),
                ProfileField(
                    label: 'Tanggal Lahir', controller: _dobController),
                ProfileField(label: 'Email', controller: _emailController),
                ProfileField(label: 'No.Telepon', controller: _phoneController),
                SizedBox(
                    height: 50), // Added more space below the No.Telepon field
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProfilePage(
                          nameController: _nameController,
                          dobController: _dobController,
                          emailController: _emailController,
                          phoneController: _phoneController,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Edit Akun'),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.purple,
                    minimumSize:
                        Size(double.infinity, 50), // Makes button full width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Added more space between the buttons
                ElevatedButton(
                  onPressed: () {
                    // Handle logout
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Keluar Akun'),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.purple,
                    minimumSize:
                        Size(double.infinity, 50), // Makes button full width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9F7FFF), Color(0xFF8055FE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.orange, size: 30),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/learning_app', (Route<dynamic> route) => false);
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.orange, size: 30),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/profile', (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  ProfileField({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              controller.text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
