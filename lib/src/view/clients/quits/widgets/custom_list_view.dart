import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:apartamentos/src/controller/clients/clients_quits_controller.dart';
import 'package:apartamentos/src/view/clients/quits/widgets/custom_quits_list_tile.dart';

class CustomListView extends StatelessWidget {
  final _clientQuitsController = Get.put(ClientsQuitsController());
  CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
        itemCount: _clientQuitsController.fetchedClientsQuitedByYear.length,
        itemBuilder: (BuildContext context, int index) {
          var client = _clientQuitsController.fetchedClientsQuitedByYear[index];
          return CustomQuitsListTile(client: client);
        },
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(height: 8,)));
  }
}
