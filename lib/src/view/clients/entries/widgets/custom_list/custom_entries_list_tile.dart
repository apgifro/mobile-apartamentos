import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:apartamentos/src/model/client.dart';
import 'package:apartamentos/src/view/clients/entries/widgets/custom_modal/custom_entries_modal.dart';
import 'package:apartamentos/src/view/clients/entries/widgets/custom_modal/custom_quits_modal.dart';

class CustomEntriesListTile extends StatelessWidget {
  final Client client;
  const CustomEntriesListTile({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _builOnTap(),
      child: _buildListTile(),
    );
  }

  _buildListTile() {
    var day = client.dateIn.split('/')[0];
    var month = DateFormat.MMMM('pt_BR')
        .format(DateTime(0, int.parse(client.dateIn.split('/')[1])));
    var year = client.dateIn.split('/')[2];

    var entrySubtitle = 'Entrou em $day de $month de $year';

    return ListTile(
        leading: CircleAvatar(child: Text(client.number.toString())),
        title: Text(client.name.split(' ')[0]),
        subtitle: Text(entrySubtitle,
            style: Theme.of(Get.context!).textTheme.displaySmall));
  }

  _builOnTap() {
    if (_isClientActive()) {
      return _showClientActiveModalBottomSheet();
    }
    if (_isClientInactive()) {
      return _showClientInactiveModalBottomSheet();
    }
  }

  bool _isClientActive() {
    return client.status == 'active';
  }

  _showClientActiveModalBottomSheet() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: Get.context!,
      builder: (BuildContext context) {
        return CustomEntriesModal(client: client);
      },
    );
  }

  bool _isClientInactive() {
    return client.status == 'inactive';
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
