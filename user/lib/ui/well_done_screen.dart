import 'package:flutter/material.dart';

class WellDoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9F7FFF), // Background color to match the design
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 36),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80), // Adjusted for better alignment
                  Text(
                    'Kerja Bagus',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32, // Increased font size
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 50), // Increased spacing
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 150, // Decreased size
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9051),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                      ),
                      Container(
                        width: 120, // Decreased size
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9051),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: Center(
                          child: CustomPaint(
                            size: Size(60, 60), // Adjust size as needed
                            painter: CheckMarkPainter(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50), // Increased spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star,
                          color: Colors.yellow, size: 60), // Increased size
                      Icon(Icons.star,
                          color: Colors.yellow, size: 60), // Increased size
                      Icon(Icons.star_border,
                          color: Color(0xFF8055FE), size: 60), // Increased size
                    ],
                  ),
                  SizedBox(height: 50), // Increased spacing
                  ElevatedButton(
                    onPressed: () {
                      // Implement next question functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 60), // Increased padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      shadowColor: Colors.black.withOpacity(0.2),
                      elevation: 5,
                    ),
                    child: Text(
                      'Soal Selanjutnya',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24, // Increased font size
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Implement retry functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8055FE),
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 60), // Increased padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      shadowColor: Colors.black.withOpacity(0.2),
                      elevation: 5,
                    ),
                    child: Text(
                      'Bermain Ulang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24, // Increased font size
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckMarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 8.0 // Increase the stroke width to make it thicker
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.5)
      ..lineTo(size.width * 0.45, size.height * 0.75)
      ..lineTo(size.width * 0.8, size.height * 0.3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
