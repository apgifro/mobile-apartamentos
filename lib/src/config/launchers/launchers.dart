import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

launchWhatsapp(String phone) async {
  String url = "whatsapp://send?phone=x55$phone";
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    Get.back();
    var snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('Erro ao abrir WhatsApp'),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}