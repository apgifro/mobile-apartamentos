import 'package:get/get.dart';

import 'package:apartamentos/src/controller/place/place_controller.dart';
import 'package:apartamentos/src/controller/widgets/year_picker_controller.dart';
import 'package:apartamentos/src/model/client.dart';
import 'package:apartamentos/src/model/database.dart';

enum ClientState { loading, loaded, empty, error }

class ClientsQuitsController extends GetxController {
  final _yearPickerController = Get.put(YearPickerController());
  final _placeController = Get.put(PlaceController(), permanent: true);

  var fetchedClientsQuitedByYear = <Client>[].obs;
  var state = Rx<ClientState>(ClientState.loading);

  fetchClientsQuitedByYear() async {
    var db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> tenants;

    tenants = await db.query('tenant',
        where: 'status = ? and place = ?',
        whereArgs: ['inactive', _placeController.place.value],
        orderBy: 'number');

    List<Client> fetchedClientsQuit = List.generate(tenants.length, (i) {
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

    fetchedClientsQuitedByYear.clear();

    for (var tenant in fetchedClientsQuit) {
      var tenantYear = tenant.dateOut!.split('/')[2];

      if (tenantYear == _yearPickerController.year.value) {
        fetchedClientsQuitedByYear.add(tenant);
      }
    }

    updateState(fetchedClientsQuitedByYear.isEmpty
        ? ClientState.empty
        : ClientState.loaded);
  }

  void updateState(ClientState newState) {
    state.value = newState;
  }
}
