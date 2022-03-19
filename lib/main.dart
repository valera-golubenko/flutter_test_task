import 'package:flutter/material.dart';

import 'screens/home_p.dart';

void main() {
  runApp(const MainP());
}

class MainP extends StatelessWidget {
  const MainP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeP(),
    );
  }
}
