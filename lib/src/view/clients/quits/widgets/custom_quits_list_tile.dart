import 'package:apartamentos/src/view/clients/quits/widgets/custom_quits_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:apartamentos/src/model/client.dart';

class CustomQuitsListTile extends StatelessWidget {
  final Client client;
  const CustomQuitsListTile({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _builOnTap(),
      child: _buildListTile(),
    );
  }

  _buildListTile() {
    var day = client.dateOut!.split('/')[0];
    var month = DateFormat.MMMM('pt_BR')
        .format(DateTime(0, int.parse(client.dateOut!.split('/')[1])));
    var year = client.dateOut!.split('/')[2];

    var entrySubtitle = 'Saiu em $day de $month de $year';

    return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red[100],
          child: Text(client.number.toString()),
        ),
        title: Text(client.name.split(' ')[0]),
        subtitle: Text(entrySubtitle,
            style: Theme.of(Get.context!).textTheme.displaySmall));
  }

  _builOnTap() {
      return _showClientInactiveModalBottomSheet();
  }

  _showClientInactiveModalBottomSheet() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: Get.context!,
      builder: (BuildContext context) {
        return CustomQuitsModal(client: client);
      },
    );
  }
}
