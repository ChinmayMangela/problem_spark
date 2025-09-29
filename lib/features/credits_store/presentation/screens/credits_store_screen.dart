import 'package:flutter/material.dart';

class CreditsStoreScreen extends StatefulWidget {
  const CreditsStoreScreen({super.key});

  @override
  State<CreditsStoreScreen> createState() => _CreditsStoreScreenState();
}

class _CreditsStoreScreenState extends State<CreditsStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Text('Credit Store Screen'),
    );
  }
}
