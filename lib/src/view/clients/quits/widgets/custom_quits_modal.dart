import 'package:apartamentos/src/model/client.dart';
import 'package:apartamentos/src/config/widgets/custom_launch_whatsapp.dart';
import 'package:apartamentos/src/view/clients/quits/widgets/custom_quits_modal_list_tile.dart';
import 'package:flutter/material.dart';

class CustomQuitsModal extends StatelessWidget {
  final Client client;
  const CustomQuitsModal({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          children: <Widget>[
            CustomQuitsModalListTile(client: client,),
            const Divider(indent: 20, endIndent: 20),
            CustomLaunchWhatsApp(client: client,),
          ],
        ),
      ),
    );
  }
}
