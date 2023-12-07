import 'package:apartamentos/src/controller/place/place_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceBottomSheet extends StatelessWidget {
  PlaceBottomSheet({super.key});

  final _placeController = Get.put(PlaceController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.location_on_outlined),
        onPressed: () {
          int change = 6;
          if (_placeController.place.value == 6) {
            change = 5;
          }
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return SizedBox(
                  height: 200,
                  child: Center(
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(_placeController.place.value.toString()),
                            ),
                            title: Text('Setor ${_placeController.place.value}'),
                            subtitle: const Text('Localização atual',
                                style: TextStyle(
                                  fontSize: 14.5,
                                  color: Colors.black54,
                                )),
                          ),
                        ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            _placeController.place.value = change;
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/clients', (Route<dynamic> route) => false);
                          },
                          child: ListTile(
                            leading: const Icon(Icons.logout_outlined),
                            title: Text('Mudar para o Setor $change'),
                          ),
                        ),
                      ])));
            },
          );
        });
  }
}
