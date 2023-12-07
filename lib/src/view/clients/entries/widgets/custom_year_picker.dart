import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:apartamentos/src/controller/clients/clients_entries_controller.dart';
import 'package:apartamentos/src/controller/widgets/year_picker_controller.dart';

class CustomYearPickerWidget {
  final _yearPickerController = Get.put(YearPickerController());
  final _clientEntriesController = Get.put(ClientsEntriesController());

  open() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Selecione o ano"),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
                firstDate: DateTime(1980, 1),
                lastDate: DateTime(DateTime.now().year, 1),
                selectedDate: DateTime.now(),
                onChanged: (DateTime dateTime) => onClick(dateTime)),
          ),
        );
      },
    );
  }

  onClick(dateTime) {
    _yearPickerController.year.value = dateTime.year.toString();
    _clientEntriesController.updateState(ClientState.loading);
    Get.back();
  }
}
