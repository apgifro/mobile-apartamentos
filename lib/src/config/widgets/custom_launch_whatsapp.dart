import 'package:apartamentos/src/config/launchers/launchers.dart';
import 'package:apartamentos/src/model/client.dart';
import 'package:flutter/material.dart';

class CustomLaunchWhatsApp extends StatelessWidget {
  final Client client;
  const CustomLaunchWhatsApp({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchWhatsapp(client.phone!),
      child: ListTile(
        title: const Text('Conversar no WhatsApp'),
        leading: SizedBox(height: 25, child: Image.asset('assets/whatsapp.png')),
      ),
    );
  }
}
