import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/style/colors.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profilo'),
        backgroundColor: backgroundTopColor,
      ),
    );
  }
}
