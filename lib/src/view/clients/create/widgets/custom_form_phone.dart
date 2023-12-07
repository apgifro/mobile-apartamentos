import 'package:apartamentos/src/controller/widgets/clients_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormPhone extends StatelessWidget {
  final _clientsFormControler = Get.put(ClientsFormController());
  CustomFormPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _clientsFormControler.phone,
      validator: (value) {
        if (!_validateNull(value)) {
          return 'Digite um número de telefone válido';
        }
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          label: Text('Telefone'),
          border: OutlineInputBorder(),
          icon: Icon(Icons.phone_outlined)),
    );
  }

  bool _validateNull(value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return true;
  }
}
