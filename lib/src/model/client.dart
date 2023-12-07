import 'package:intl/intl.dart';


class Client {
  int? id;
  final String name;
  final int number;
  final int value;
  final String dateIn;
  late final String day = dateIn.split('/')[0];
  late final String month = dateIn.split('/')[1];
  late final String year = dateIn.split('/')[2];
  late final DateTime date = DateTime(0, int.parse(month));
  late final monthDate = DateFormat.MMMM('pt_BR').format(date);
  late final String textIn = 'Entrou em $day de $monthDate de $year';
  String? dateOut;
  String status;
  final int place;
  String? phone;

  Client({
    this.id,
    required this.name,
    required this.number,
    required this.value,
    required this.dateIn,
    this.dateOut,
    required this.status,
    required this.place,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'value': value,
      'dateIn': dateIn,
      'dateOut': dateOut,
      'status': status,
      'place': place,
      'phone': phone,
    };
  }

  @override
  String toString() {
    return 'Tenant{id: $id, name: $name}';
  }
}
