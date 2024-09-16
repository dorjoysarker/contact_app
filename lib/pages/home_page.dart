import 'package:contact_app/pages/new_contact_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context,NewContactPage.routeName),
        child: const Icon(Icons.add),
      ),
    );
  }
}
