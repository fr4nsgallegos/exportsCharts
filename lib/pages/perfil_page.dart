import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: Icon(Icons.swipe_left_alt)),
        title: Text("PERFIL"),
      ),
    );
  }
}
