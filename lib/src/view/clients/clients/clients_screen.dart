import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:apartamentos/src/controller/clients/clients_controller.dart';
import 'package:apartamentos/src/config/widgets/custom_error_screen.dart';
import 'package:apartamentos/src/config/widgets/custom_place_switch.dart';
import 'package:apartamentos/src/controller/widgets/fab_controller.dart';
import 'package:apartamentos/src/view/clients/clients/widgets/custom_list_view.dart';
import 'package:apartamentos/src/config/routes/menu_items.dart';

class ClientsScreen extends StatelessWidget {
  ClientsScreen({Key? key}) : super(key: key);

  final _clientController = Get.put(ClientsController());
  final _floatingActionButtonController = Get.put(Fab());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  _buildAppBar() {
    return AppBar(
      actions: [_buildPopUpMenuButton()],
      leading: PlaceBottomSheet(),
      centerTitle: true,
      title: const Text('Contratos'),
    );
  }

  _buildPopUpMenuButton() {
    return PopupMenuButton(
      tooltip: 'Mais',
      onSelected: (String value) => Get.toNamed(value),
      itemBuilder: (BuildContext context) => menuItems,
    );
  }

  _buildBody() {
    return Obx(() {
      _clientController.fetch();
      switch (_clientController.state.value) {
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
      child: Text('Adicione o primeiro locatário!',
          style: Theme.of(Get.context!).textTheme.displayMedium),
    );
  }

  _buildFloatingActionButton() {
    return Obx(() => AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: _showOrHideFloatingActionButton(),
          child: FloatingActionButton(
            onPressed: () => Get.toNamed('/clients_create'),
            tooltip: 'Adicionar',
            child: const Icon(Icons.add),
          ),
        ));
  }

  _showOrHideFloatingActionButton() {
    return _floatingActionButtonController.fabIsVisible.value ? 1.0 : 0.0;
  }
}
