import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:apartamentos/src/controller/widgets/clients_form_controller.dart';

class CustomInsertClientButton extends StatelessWidget {
  CustomInsertClientButton({super.key, this.formKey});

  final formKey;
  final _clientsFormControler = Get.put(ClientsFormController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
        child: ElevatedButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              _clientsFormControler.insertClient();
            }
          },
          child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check),
                SizedBox(width: 10),
                Text('Salvar')
              ]),
        ),
      ),
    );
  }
}
