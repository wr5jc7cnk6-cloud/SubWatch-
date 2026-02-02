import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const SubWatchApp());
}

class SubWatchApp extends StatelessWidget {
  const SubWatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> glowAnim;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    glowAnim = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.forward();

    // 3秒後にホームへ
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: glowAnim,
        builder: (context, child) {
          return Center(
            child: Opacity(
              opacity: glowAnim.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // 光ライン
                  Container(
                    height: 3,
                    width: 200 * glowAnim.value,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.8),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ロゴ
                  const Text(
                    "SubWatch",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          "Home",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }
}
