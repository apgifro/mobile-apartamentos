import 'package:apartamentos/src/controller/widgets/clients_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormWork extends StatelessWidget {
  final _clientsFormControler = Get.put(ClientsFormController());
  CustomFormWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
      child: TextFormField(
        controller: _clientsFormControler.work,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (!_validateNull(value)) {
            return 'Digite uma profissão válida';
          }
        },
        decoration: const InputDecoration(
          label: Text('Profissão'),
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
