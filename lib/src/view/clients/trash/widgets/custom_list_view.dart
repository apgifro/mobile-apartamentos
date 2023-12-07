import 'package:apartamentos/src/controller/clients/clients_controller.dart';
import 'package:apartamentos/src/controller/clients/clients_trash_controller.dart';
import 'package:apartamentos/src/view/clients/trash/widgets/custom_trash_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListView extends StatelessWidget {
  final _clientTrashController = Get.put(ClientsTrashController());
  CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
        itemCount: _clientTrashController.fetchedClientsTrashByYear.length,
        itemBuilder: (BuildContext context, int index) {
          var client = _clientTrashController.fetchedClientsTrashByYear[index];
          return CustomTrashListTile(client: client);
        },
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(height: 8,)));
  }
}
