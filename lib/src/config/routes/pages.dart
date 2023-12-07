import 'package:get/get.dart';

import 'package:apartamentos/src/view/views.dart';

var customPages = [
  GetPage(name: '/clients', page: () => ClientsScreen()),
  GetPage(name: '/clients_create', page: () => ClientsCreateScreen()),
  GetPage(name: '/clients_entries', page: () => ClientsEntriesScreen()),
  GetPage(name: '/clients_quits', page: () => ClientsQuitsScreen()),
  GetPage(name: '/clients_trash', page: () => ClientsTrashScreen()),
];
