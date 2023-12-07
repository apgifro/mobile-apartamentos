import 'package:apartamentos/src/model/client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomTrashModalListTile extends StatelessWidget {
  final Client client;
  const CustomTrashModalListTile({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red[100],
          child: Text(client.number.toString()),
        ),
        title: Text(client.name),
        subtitle: Text('Apagado',
            style: Theme.of(Get.context!).textTheme.displaySmall),
      ),
    );
  }
}
