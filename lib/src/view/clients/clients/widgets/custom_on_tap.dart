import 'package:apartamentos/src/config/widgets/custom_launch_whatsapp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:apartamentos/src/config/widgets/custom_phone_dialog.dart';
import 'package:apartamentos/src/controller/clients/clients_controller.dart';
import 'package:apartamentos/src/model/client.dart';

class CustomOnTap extends StatelessWidget {
  final Client client;
  final _clientController = Get.put(ClientsController());
  CustomOnTap({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _buildOnTapListTile(),
          const Divider(indent: 20, endIndent: 20),
          _buildOnTapDelete(),
          _buildOnTapPhoneEdit(),
          _buildOnTapClientQuit(),
          CustomLaunchWhatsApp(client: client)
        ],
      ),
    );
  }

  _buildOnTapListTile() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(client.number.toString()),
        ),
        title: Text(client.name),
        subtitle: Text(r'R$ ' + client.value.toString(),
            style: Theme.of(Get.context!).textTheme.displaySmall),
      ),
    );
  }

  _buildOnTapDelete() {
    return GestureDetector(
      onTap: () {
        _clientController.delete(client);
        var snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('${client.name} apagado'),
        );
        ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
        Get.back();
      },
      child: const ListTile(
        leading: Icon(Icons.delete_outline),
        title: Text('Apagar'),
      ),
    );
  }

  _buildOnTapPhoneEdit() {
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

  _buildOnTapClientQuit() {
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
