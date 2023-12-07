import 'package:apartamentos/src/controller/clients/clients_entries_controller.dart';
import 'package:apartamentos/src/view/clients/entries/widgets/custom_list/custom_entries_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListView extends StatelessWidget {
  final _clientEntriesController = Get.put(ClientsEntriesController());
  CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
        itemCount: _clientEntriesController.fetchedClientsByYear.length,
        itemBuilder: (BuildContext context, int index) {
          var client = _clientEntriesController.fetchedClientsByYear[index];
          return CustomEntriesListTile(client: client);
        },
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(height: 8,)));
  }
}
