import 'package:apartamentos/src/controller/widgets/clients_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormName extends StatelessWidget {
  final _clientsFormControler = Get.put(ClientsFormController());
  CustomFormName({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _clientsFormControler.name,
      validator: (value) {
        if (!_validateNull(value)) {
          return 'Digite um nome válido';
        }
      },
      autofocus: true,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          label: Text('Nome'),
          border: OutlineInputBorder(),
          icon: Icon(Icons.face)),
    );
  }

  bool _validateNull(value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return true;
  }
}
