import 'package:flutter/material.dart';

class CardapiosTab extends StatelessWidget {
  final String title;
  const CardapiosTab({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(text: title);
  }
}
