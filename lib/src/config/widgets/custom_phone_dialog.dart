import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:apartamentos/src/controller/clients/clients_controller.dart';
import 'package:apartamentos/src/model/client.dart';

class PickPhoneDialog extends StatelessWidget {
  final Client client;
  final _clientController = Get.put(ClientsController());
  PickPhoneDialog({super.key, required this.client});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _phone.text = client.phone!;
    return AlertDialog(
      title: const Text('Editar telefone'),
      content: Row(
        children: <Widget>[
          Expanded(
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _phone,
                validator: (value) {
                  if (!_validateNull(value)) {
                    return 'Digite um número de telefone válido';
                  }
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Telefone'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('OK'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.of(context).pop();
              _clientController.edit(client, _phone.text);
            }
          },
        ),
      ],
    );
  }

  bool _validateNull(value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return true;
  }
}
