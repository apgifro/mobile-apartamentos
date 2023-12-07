import 'package:apartamentos/src/view/clients/trash/widgets/custom_trash_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:apartamentos/src/model/client.dart';

class CustomTrashListTile extends StatelessWidget {
  final Client client;
  const CustomTrashListTile({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _builOnTap(),
      child: _buildListTile(),
    );
  }

  _buildListTile() {
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red[100],
          child: Text(client.number.toString()),
        ),
        title: Text(client.name.split(' ')[0]));
  }

  _builOnTap() {
      return _showClientInactiveModalBottomSheet();
  }

  _showClientInactiveModalBottomSheet() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: Get.context!,
      builder: (BuildContext context) {
        return CustomTrashModal(client: client);
      },
    );
  }
}
