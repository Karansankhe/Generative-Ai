import 'package:flutter/material.dart';
import 'package:healthcare_app/pages/tabs.dart';

void main() {

  // const Color primary = Color.fromRGBO(23, 20, 51, 1);
  // const Color secondary1 = Color.fromRGBO(113, 104, 211, 1);
  // const Color secondary2 = Color.fromRGBO(126, 228, 240, 1);
  // const Color neutral = Color.fromRGBO(242, 241, 249, 1);

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tabs(),
    ),
  );
}
