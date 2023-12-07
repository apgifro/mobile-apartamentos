import 'package:apartamentos/src/controller/widgets/clients_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormDate extends StatelessWidget {
  final _clientsFormControler = Get.put(ClientsFormController());
  final DateTime now = DateTime.now();
  late DateTime dateSelection;

  CustomFormDate({super.key});

  @override
  Widget build(BuildContext context) {
    _clientsFormControler.date.text = '${now.day}/${now.month}/${now.year}';
    return TextFormField(
      onTap: () async {
        dateSelection = (await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1980),
          lastDate: DateTime(DateTime.now().year + 1),
        ))!;
        _clientsFormControler.date.text =
            '${dateSelection.day}/${dateSelection.month}/${dateSelection.year}';
      },
      readOnly: true,
      controller: _clientsFormControler.date,
      validator: (value) {
        if (!_validateNull(value)) {
          return 'Digite uma data válida';
        }
      },
      decoration: const InputDecoration(
        icon: Icon(Icons.date_range_outlined),
        label: Text('Data'),
        suffixIcon: Icon(Icons.arrow_drop_down),
        border: OutlineInputBorder(),
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
