import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 10 seconds
    Future.delayed(Duration(seconds: 20), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SecondScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: Size(double.infinity, double.infinity),
        painter: DiagonalShapesPainter(),
        child: Center(
          child: Container(
            width: 160, // Size of the image button
            height: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.jpg'), // Path to your image
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DiagonalShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()
      ..color = Color(0xFFfad2cf) // First triangle color
      ..style = PaintingStyle.fill;

    Paint paint2 = Paint()
      ..color = Color(0xFFffebee) // Second triangle color
      ..style = PaintingStyle.fill;

    double startY = size.height * 0.2; // Start both triangles below the top (adjust as needed)

    // First triangle: starts below top-left to bottom-left diagonally
    Path triangle1 = Path();
    triangle1.moveTo(0, size.height * 0.1); // Start below the top-left corner
    triangle1.lineTo(0, size.height); // Bottom-left corner
    triangle1.lineTo(size.width, size.height); // Bottom-right corner
    triangle1.close();
    canvas.drawPath(triangle1, paint1);

    // Second triangle: starts below bottom-left and covers another diagonal area
    Path triangle2 = Path();
    triangle2.moveTo(0, size.height); // Bottom-left corner
    triangle2.lineTo(size.width, size.height * 0.3); // Adjusted to start below top-right
    triangle2.lineTo(size.width, size.height); // Bottom-right corner
    triangle2.close();
    canvas.drawPath(triangle2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// Second screen with the same background
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: Size(double.infinity, double.infinity),
        painter: DiagonalShapesPainter(),
      ),
    );
  }
}
