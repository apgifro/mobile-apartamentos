import 'package:apartamentos/src/controller/place/place_controller.dart';
import 'package:get/get.dart';

import '../../model/database.dart';
import '../../model/client.dart';
import '../widgets/year_picker_controller.dart';

enum ClientState { loading, loaded, empty, error }

class ClientsEntriesController extends GetxController {
  final _yearPickerController = Get.put(YearPickerController());
  final _placeController = Get.put(PlaceController(), permanent: true);

  var fetchedClientsByYear = <Client>[].obs;
  var state = Rx<ClientState>(ClientState.loading);

  fetchEntriesByYear() async {
    var db = await DatabaseHelper.instance.database;
    var tenants = await db.query('tenant',
        where: 'place = ?', whereArgs: [_placeController.place.value]);

    List<Client> fetchedClients = List.generate(tenants.length, (i) {
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

    fetchedClientsByYear.clear();

    for (var client in fetchedClients) {
      if (client.status == 'delete') {
        continue;
      }
      var tenantYear = client.dateIn.split('/')[2];
      if (tenantYear == _yearPickerController.year.value) {
        fetchedClientsByYear.add(client);
      }
    }
    updateState(
        fetchedClientsByYear.isEmpty ? ClientState.empty : ClientState.loaded);
  }

  void updateState(ClientState newState) {
    state.value = newState;
  }
}
