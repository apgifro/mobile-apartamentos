import 'package:apartamentos/src/model/client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomEntriesModalListTile extends StatelessWidget {
  final Client client;
  const CustomEntriesModalListTile({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    var priceSubtitle = r'R$ ' + client.value.toString();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(client.number.toString()),
        ),
        title: Text(client.name),
        subtitle: Text(priceSubtitle,
            style: Theme.of(Get.context!).textTheme.displaySmall),
      ),
    );
  }
}
