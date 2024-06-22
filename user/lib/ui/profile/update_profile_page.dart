import 'package:flutter/material.dart';

class UpdateProfilePage extends StatefulWidget {
  static const String routeName = '/profile_update';

  final TextEditingController nameController;
  final TextEditingController dobController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  UpdateProfilePage({
    required this.nameController,
    required this.dobController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9F7FFF), Color(0xFF8055FE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/profile.jpg'), // Replace with your image asset
                      ),
                      SizedBox(height: 20),
                      ProfileField(
                        label: 'Nama',
                        controller: widget.nameController,
                        isEditing: true,
                      ),
                      ProfileField(
                        label: 'Tanggal Lahir',
                        controller: widget.dobController,
                        isEditing: true,
                        isDateField: true,
                        focusNode: _focusNode,
                        onDateFieldTapped: () async {
                          _focusNode.unfocus();
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              widget.dobController.text =
                                  "${selectedDate.day} ${_monthString(selectedDate.month)} ${selectedDate.year}";
                            });
                          }
                        },
                      ),
                      ProfileField(
                        label: 'No.Telepon',
                        controller: widget.phoneController,
                        isEditing: true,
                      ),
                      ProfileField(
                        label: 'Email',
                        controller: widget.emailController,
                        isEditing: true,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Ubah'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF9F7FFF), Color(0xFF8055FE)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.orange),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.star, color: Colors.orange),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: Colors.orange),
                    label: '',
                  ),
                ],
                onTap: (index) {
                  if (index == 0) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false);
                  } else if (index == 1) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/history_screen', (Route<dynamic> route) => false);
                  } else if (index == 2) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/profile', (Route<dynamic> route) => false);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _monthString(int month) {
    switch (month) {
      case 1:
        return "Januari";
      case 2:
        return "Februari";
      case 3:
        return "Maret";
      case 4:
        return "April";
      case 5:
        return "Mei";
      case 6:
        return "Juni";
      case 7:
        return "Juli";
      case 8:
        return "Agustus";
      case 9:
        return "September";
      case 10:
        return "Oktober";
      case 11:
        return "November";
      case 12:
        return "Desember";
      default:
        return "";
    }
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isEditing;
  final bool isDateField;
  final VoidCallback? onDateFieldTapped;
  final FocusNode? focusNode;

  ProfileField({
    required this.label,
    required this.controller,
    this.isEditing = false,
    this.isDateField = false,
    this.onDateFieldTapped,
    this.focusNode,
  });

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
          GestureDetector(
            onTap: isDateField ? onDateFieldTapped : null,
            child: AbsorbPointer(
              absorbing: isDateField && isEditing,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: isEditing
                          ? TextField(
                              focusNode: focusNode,
                              controller: controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: TextStyle(fontSize: 16),
                              keyboardType: isDateField
                                  ? TextInputType.none
                                  : TextInputType.text,
                            )
                          : Text(
                              controller.text,
                              style: TextStyle(fontSize: 16),
                            ),
                    ),
                    if (isDateField)
                      Icon(Icons.calendar_today, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
