import 'package:flutter/material.dart';
import 'app_view/app_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppView(),
    );
  }
}