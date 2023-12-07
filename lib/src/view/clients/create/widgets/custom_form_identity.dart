import 'package:apartamentos/src/controller/widgets/clients_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormIdentity extends StatelessWidget {
  final _clientsFormControler = Get.put(ClientsFormController());
  CustomFormIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _clientsFormControler.identity,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (!_validateNull(value)) {
          return 'Digite um RG válido';
        }
      },
      decoration: const InputDecoration(
          label: Text('RG'),
          border: OutlineInputBorder(),
          icon: Icon(Icons.perm_identity)),
    );
  }

  bool _validateNull(value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return true;
  }
}
