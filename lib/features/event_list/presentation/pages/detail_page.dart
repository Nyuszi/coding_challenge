import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailedPage extends StatelessWidget {
  final String id;
  const DetailedPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('detail')),
      body: Center(
        child: Text('detail of id:$id'),
      ),
    );
  }
}
