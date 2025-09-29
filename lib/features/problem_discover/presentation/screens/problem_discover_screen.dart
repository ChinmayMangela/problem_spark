import 'package:flutter/material.dart';

class ProblemDiscoverScreen extends StatefulWidget {
  const ProblemDiscoverScreen({super.key});

  @override
  State<ProblemDiscoverScreen> createState() => _ProblemDiscoverScreenState();
}

class _ProblemDiscoverScreenState extends State<ProblemDiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
  
  Widget _buildBody() {
    return Center(
      child: Text('Problem Discover Screen'),
    );
  }
}
