import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:apartamentos/src/model/client.dart';

class CustomQuitsModalListTile extends StatelessWidget {
  final Client client;
  const CustomQuitsModalListTile({super.key, required this.client});

  @override
  Widget build(BuildContext context) {

    var day = client.dateOut!.split('/')[0];
    var month = DateFormat.MMMM('pt_BR').format(
        DateTime(0, int.parse(client.dateOut!.split('/')[1])));
    var year = client.dateOut!.split('/')[2];

    var quitSubtitle = 'Saiu em $day de $month de $year';

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(client.number.toString()),
        ),
        title: Text(client.name),
        subtitle: Text(quitSubtitle,
            style: Theme.of(Get.context!).textTheme.displaySmall),
      ),
    );
  }
}
