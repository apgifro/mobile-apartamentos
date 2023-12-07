import 'package:apartamentos/src/config/widgets/custom_phone_dialog.dart';
import 'package:apartamentos/src/controller/clients/clients_controller.dart';
import 'package:apartamentos/src/model/client.dart';
import 'package:apartamentos/src/config/widgets/custom_launch_whatsapp.dart';
import 'package:apartamentos/src/view/clients/entries/widgets/custom_list/custom_entries_modal_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomEntriesModal extends StatelessWidget {
  final Client client;
  final _clientController = Get.put(ClientsController());
  CustomEntriesModal({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Center(
        child: Column(
          children: <Widget>[
            CustomEntriesModalListTile(
              client: client,
            ),
            const Divider(indent: 20, endIndent: 20),
            _buildOnTapDelete(),
            _buildPhoneEdit(),
            _buildQuit(),
            CustomLaunchWhatsApp(
              client: client,
            ),
          ],
        ),
      ),
    );
  }

  _buildOnTapDelete() {
    return GestureDetector(
      onTap: () {
        _clientController.delete(client);
        var snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('${client.name} apagado'));
        ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
        Get.toNamed('/clients');
      },
      child: const ListTile(
        leading: Icon(Icons.delete_outline),
        title: Text('Apagar'),
      ),
    );
  }

  _buildPhoneEdit() {
    return GestureDetector(
      onTap: () {
        Get.back();
        showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return PickPhoneDialog(client: client);
            }
        );
      },
      child: const ListTile(
        leading: Icon(Icons.phone_outlined),
        title: Text('Editar telefone'),
      ),
    );
  }

  _buildQuit() {
    return GestureDetector(
      onTap: () async {
        Get.back();
        DateTime DateSelection = DateTime.now();
        DateSelection = (await showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(1980),
            lastDate: DateTime(DateTime.now().year + 1)))!;
        _clientController.archive(client,
            '${DateSelection.day}/${DateSelection.month}/${DateSelection.year}');
        var snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('${client.name} saiu'),
        );
        ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
        Get.toNamed('/clients');
      },
      child: const ListTile(
        title: Text('Registrar saída'),
        leading: Icon(Icons.vpn_key_outlined),
      ),
    );
  }
}
