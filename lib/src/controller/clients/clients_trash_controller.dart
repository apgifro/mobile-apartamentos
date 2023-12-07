import 'package:get/get.dart';

import 'package:apartamentos/src/model/client.dart';
import 'package:apartamentos/src/model/database.dart';
import 'package:apartamentos/src/controller/place/place_controller.dart';
import 'package:apartamentos/src/controller/widgets/year_picker_controller.dart';

enum ClientState { loading, loaded, empty, error }

class ClientsTrashController extends GetxController {
  final _yearPickerController = Get.put(YearPickerController());
  final _placeController = Get.put(PlaceController(), permanent: true);

  var fetchedClientsTrashByYear = <Client>[].obs;
  var state = Rx<ClientState>(ClientState.loading);

  fetchClientsDeletedByYear() async {
    var db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> tenants;

    tenants = await db.query('tenant',
        where: 'status = ? and place = ?',
        whereArgs: ['delete', _placeController.place.value],
        orderBy: 'number');

    List<Client> listClients = List.generate(tenants.length, (i) {
      return Client(
        id: tenants[i]['id'],
        name: tenants[i]['name'],
        number: tenants[i]['number'],
        value: tenants[i]['value'],
        dateIn: tenants[i]['dateIn'],
        dateOut: tenants[i]['dateOut'],
        status: tenants[i]['status'],
        place: tenants[i]['place'],
        phone: tenants[i]['phone'],
      );
    });

    fetchedClientsTrashByYear.clear();

    for (var tenant in listClients) {
      var tenantYear = tenant.dateIn.split('/')[2];
      if (tenantYear == _yearPickerController.year.value) {
        fetchedClientsTrashByYear.add(tenant);
      }
    }

    updateState(fetchedClientsTrashByYear.isEmpty
        ? ClientState.empty
        : ClientState.loaded);
  }

  void updateState(ClientState newState) {
    state.value = newState;
  }
}
