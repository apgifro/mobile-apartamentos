import 'package:apartamentos/src/controller/widgets/clients_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormMarital extends StatelessWidget {
  final _clientsFormControler = Get.put(ClientsFormController());

  CustomFormMarital({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
      child: TextFormField(
        controller: _clientsFormControler.marital,
        validator: (value) {
          if (!_validateNull(value)) {
            return 'Digite um estado civil válido';
          }
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          label: Text('Estado civil'),
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
