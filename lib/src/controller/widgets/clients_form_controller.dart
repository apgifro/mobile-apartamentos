import 'package:apartamentos/src/controller/clients/clients_contract_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:apartamentos/src/controller/clients/clients_controller.dart';
import 'package:apartamentos/src/model/contract.dart';

class ClientsFormController extends GetxController {
  final name = TextEditingController();
  final marital = TextEditingController();
  final work = TextEditingController();
  final identity = TextEditingController();
  final cpf = TextEditingController();
  final number = TextEditingController();
  final value = TextEditingController();
  final phone = TextEditingController();
  final date = TextEditingController();

  final _clientController = Get.put(ClientsController());

  @override
  void onClose() {
    name.dispose();
    marital.dispose();
    work.dispose();
    identity.dispose();
    cpf.dispose();
    number.dispose();
    value.dispose();
    phone.dispose();
    date.dispose();
  }

  insertClient() {
    _clientController.insert(name.text, int.parse(number.text),
        int.parse(value.text), date.text, phone.text);

    final contract = Contract(
        name: name.text.toUpperCase(),
        identity: identity.text,
        cpf: cpf.text,
        apartmentNumber: number.text,
        price: value.text,
        marital: marital.text.toLowerCase(),
        work: work.text.toLowerCase(),
        date: date.text);

    final clientsContractController = ClientsContractController(contract: contract);

    clientsContractController.makeContract();

    Get.offAllNamed('/clients');
    _clientController.updateState(ClientState.loading);
  }
}
