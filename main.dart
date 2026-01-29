import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SubWatch(),
    );
  }
}

class SubWatch extends StatefulWidget {
  const SubWatch({super.key});

  @override
  State<SubWatch> createState() => _SubWatchState();
}

class _SubWatchState extends State<SubWatch> {
  Timer? timer;
  int milliseconds = 0;
  bool isRunning = false;

  // スタート
  void start() {
    if (isRunning) return;
    isRunning = true;

    timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {
        milliseconds += 100;
      });
    });
  }

  // ストップ
  void stop() {
    timer?.cancel();
    isRunning = false;
  }

  // リセット
  void reset() {
    stop();
    setState(() {
      milliseconds = 0;
    });
  }

  // 時間表示フォーマット
  String formatTime(int ms) {
    int seconds = (ms / 1000).floor();
    int minutes = (seconds / 60).floor();
    seconds %= 60;
    int deci = (ms % 1000) ~/ 100;

    return '${minutes.toString().padLeft(2, '0')}:'
           '${seconds.toString().padLeft(2, '0')}.'
           '$deci';
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 時間表示
            Text(
              formatTime(milliseconds),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w300,
              ),
            ),

            const SizedBox(height: 40),

            // ボタン群
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: start,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: const Text('START'),
                ),

                const SizedBox(width: 16),

                ElevatedButton(
                  onPressed: stop,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: const Text('STOP'),
                ),

                const SizedBox(width: 16),

                ElevatedButton(
                  onPressed: reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: const Text('RESET'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
