import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Home'),
      ),
      body: const Center(
        child: Text('Welcome to the Client Home Screen'),
      ),
    );
  }
}
