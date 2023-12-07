import 'package:apartamentos/src/controller/clients/clients_controller.dart';
import 'package:apartamentos/src/controller/widgets/fab_controller.dart';
import 'package:apartamentos/src/view/clients/clients/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListView extends StatelessWidget {
  final _clientController = Get.put(ClientsController());
  final _floatingActionButtonController =
      Get.put(Fab());

  CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
        controller: _floatingActionButtonController.controller,
        itemCount: _clientController.fetchedActiveClients.length,
        itemBuilder: (BuildContext context, int index) {
          var client = _clientController.fetchedActiveClients[index];
          return CustomListTile(client: client);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 8,)));
  }
}
