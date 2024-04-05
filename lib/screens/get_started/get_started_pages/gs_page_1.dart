import 'package:flutter/material.dart';

class GSPageOne extends StatefulWidget {
  const GSPageOne({super.key});

  @override
  State<GSPageOne> createState() => _GSPageOneState();
}

class _GSPageOneState extends State<GSPageOne> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 1'),
    );
  }
}
