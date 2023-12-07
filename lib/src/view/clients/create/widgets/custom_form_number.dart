import 'package:apartamentos/src/controller/widgets/clients_form_controller.dart';
import 'package:apartamentos/src/controller/place/place_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormNumber extends StatelessWidget {
  CustomFormNumber({super.key});

  final _clientsFormControler = Get.put(ClientsFormController());
  final _placeController = Get.put(PlaceController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: _clientsFormControler.number,
      validator: (value) {
        if (!_validateNull(value)) {
          return 'Digite um número válido';
        }
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: const Text('Número do apartamento'),
          suffixText: _placeController.place.value == 6 ? '/10' : '/11',
          border: const OutlineInputBorder(),
          icon: const Icon(Icons.looks_two_outlined)),
    );
  }

  bool _validateNull(value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return true;
  }
}
