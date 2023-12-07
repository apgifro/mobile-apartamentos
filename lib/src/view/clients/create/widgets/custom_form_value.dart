import 'package:apartamentos/src/controller/widgets/clients_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormValue extends StatelessWidget {
  final _clientsFormControler = Get.put(ClientsFormController());
  CustomFormValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: _clientsFormControler.value,
        validator: (value) {
          if (!_validateNull(value)) {
            return 'Digite um valor válido';
          }
        },
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          label: Text(r'R$'),
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
