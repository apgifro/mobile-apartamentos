import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:apartamentos/src/config/widgets/custom_error_screen.dart';
import 'package:apartamentos/src/controller/clients/clients_trash_controller.dart';
import 'package:apartamentos/src/controller/widgets/year_picker_controller.dart';
import 'package:apartamentos/src/view/clients/trash/widgets/custom_list_view.dart';
import 'package:apartamentos/src/view/clients/trash/widgets/custom_year_picker.dart';

class ClientsTrashScreen extends StatelessWidget {
  ClientsTrashScreen({Key? key}) : super(key: key);

  final _clientTrashController = Get.put(ClientsTrashController());
  final _yearPickerController = Get.put(YearPickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Apagados'),
      actions: [
        IconButton(
            onPressed: () => CustomYearPickerWidget().open(),
            icon: const Icon(Icons.date_range_outlined))
      ],
    );
  }

  _buildBody() {
    return Obx(() {
      _clientTrashController.fetchClientsDeletedByYear();
      switch (_clientTrashController.state.value) {
        case ClientState.loaded:
          return CustomListView();
        case ClientState.empty:
          return _buildIsEmpty();
        case ClientState.error:
          return const CustomErrorScreen();
        default:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }

  _buildIsEmpty() {
    return Center(
        child: Obx(() => Text(
              'Ano de ${_yearPickerController.year.value} vazio.',
              style: Theme.of(Get.context!).textTheme.displayMedium,
            )));
  }
}
