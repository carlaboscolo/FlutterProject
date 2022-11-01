import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/components/card.dart';
import 'package:flutter_project/presentation/style/colors.dart';

class SeriePage extends StatefulWidget {
  const SeriePage({super.key});

  @override
  State<SeriePage> createState() => _SeriePageState();
}

class _SeriePageState extends State<SeriePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Serie'),
          backgroundColor: backgroundTopColor,
        ),
        body: CardComponent());
  }
}
