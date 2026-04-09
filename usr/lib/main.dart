import 'package:flutter/material.dart';
import 'screens/cv_form_screen.dart';

void main() {
  runApp(const ATSCVBuilderApp());
}

class ATSCVBuilderApp extends StatelessWidget {
  const ATSCVBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATS CV Builder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CVFormScreen(),
      },
    );
  }
}
