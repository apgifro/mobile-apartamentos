import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:apartamentos/src/model/client.dart';
import 'package:apartamentos/src/view/clients/clients/widgets/custom_on_tap.dart';

class CustomListTile extends StatelessWidget {
  final Client client;
  const CustomListTile({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _buildOnTap(),
      child: _buildListTile(),
    );
  }

  _buildListTile() {
    return ListTile(
      leading: CircleAvatar(child: Text(client.number.toString())),
      title: Text(client.name.split(' ')[0]),
      subtitle: Text(client.textIn, style: _buildTextStyleSmall()),
    );
  }

  _buildTextStyleSmall() {
    return Theme.of(Get.context!).textTheme.displaySmall;
  }

  _buildOnTap() {
    return showModalBottomSheet<void>(
        context: Get.context!,
        builder: (BuildContext context) {
          return SizedBox(height: 350, child: CustomOnTap(client: client));
        });
  }
}
