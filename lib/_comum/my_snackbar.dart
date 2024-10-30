import 'package:flutter/material.dart';

void mostrarSnackbar(
    {required BuildContext context,
    required String mensagem,
    bool isError = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(mensagem),
    backgroundColor: isError ? Colors.red : Colors.green,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    duration: const Duration(seconds: 4),
    showCloseIcon: true,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
