import 'package:apartamentos/src/controller/widgets/clients_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormCPF extends StatelessWidget {
  final _clientsFormControler = Get.put(ClientsFormController());
  CustomFormCPF({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (!_validateNull(value)) {
            return 'Digite um CPF válido';
          }
        },
        controller: _clientsFormControler.cpf,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          label: Text('CPF'),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  bool _validateNull(value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return true;
  }
}
