import 'package:flutter/material.dart';

class CustomErrorScreen extends StatelessWidget {
  const CustomErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Erro ao carregar.',
      style: TextStyle(fontSize: 17.5),
    ));
  }
}
