import 'package:apartamentos/src/controller/place/place_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormPlace extends StatelessWidget {
  CustomFormPlace({super.key});

  final _placeController = Get.put(PlaceController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      initialValue: 'Setor ${_placeController.place.value}',
      decoration: const InputDecoration(
          label: Text('Setor'),
          border: OutlineInputBorder(),
          icon: Icon(Icons.map_outlined)),
    );
  }
}
