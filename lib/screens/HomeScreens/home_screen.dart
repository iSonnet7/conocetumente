import 'package:conocetumente/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina principal"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async => await loginProvider.logout(),
          )
        ],
      ),
    );
  }
}
