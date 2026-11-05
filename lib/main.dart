import 'package:flutter/material.dart';
import 'counter_buttons.dart';
import 'counter_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'T7 Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6558C3),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F2FA),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('Counter dimulai');
  }

  @override
  void dispose() {
    debugPrint('Counter ditutup');
    super.dispose();
  }

  void tambahCounter() {
    setState(() {
      counter++;
    });
  }

  void kurangiCounter() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nilai Counter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              CounterDisplay(
                counter: counter,
              ),

              const SizedBox(height: 40),

              CounterButtons(
                onAdd: tambahCounter,
                onSubtract: kurangiCounter,
                onReset: resetCounter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}