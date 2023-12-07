import 'package:get/get.dart';

import 'package:apartamentos/src/controller/place/place_controller.dart';
import 'package:apartamentos/src/model/client.dart';
import 'package:apartamentos/src/model/database.dart';

enum ClientState { loading, loaded, empty, error }

class ClientsController extends GetxController {
  var state = Rx<ClientState>(ClientState.loading);
  final _placeController = Get.put(PlaceController(), permanent: true);

  var fetchedActiveClients = <Client>[].obs;

  fetch() async {
    var db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> tenants;

    tenants = await db.query('tenant',
        where: 'status = ? and place = ?',
        whereArgs: ['active', _placeController.place.value],
        orderBy: 'number');

    fetchedActiveClients.clear();

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

    fetchedActiveClients.assignAll(listClients);

    updateState(
        fetchedActiveClients.isEmpty ? ClientState.empty : ClientState.loaded);
  }

  insert(
      String name, int number, int value, String dateIn, String phone) async {
    var tenant = Client(
      name: name,
      number: number,
      value: value,
      dateIn: dateIn,
      status: 'active',
      place: _placeController.place.value,
      phone: phone,
    );

    var db = await DatabaseHelper.instance.database;

    await db?.insert('tenant', tenant.toMap());
  }

  edit(Client tenant, String phone) async {
    tenant.phone = phone;

    var db = await DatabaseHelper.instance.database;

    await db.update('tenant', tenant.toMap(),
        where: 'id = ?', whereArgs: [tenant.id]);

    updateState(ClientState.loading);
  }

  archive(Client tenant, String dateOut) async {
    tenant.status = 'inactive';
    tenant.dateOut = dateOut;

    var db = await DatabaseHelper.instance.database;

    await db.update('tenant', tenant.toMap(),
        where: 'id = ?', whereArgs: [tenant.id]);

    updateState(ClientState.loading);
  }

  delete(Client tenant) async {
    tenant.status = 'delete';

    var db = await DatabaseHelper.instance.database;

    await db.update('tenant', tenant.toMap(),
        where: 'id = ?', whereArgs: [tenant.id]);

    updateState(ClientState.loading);
  }

  updateState(ClientState newState) {
    state.value = newState;
  }
}
