import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/provider/login_provider.dart';
import 'package:reccomandations_app/widgets/login_methods_widget.dart';

class AccountPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    String nameToDisplay =
        loginProvider.user.displayName ?? loginProvider.user.email;
    return Container(
      color: Theme.of(context).canvasColor,
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(
            index.toString(),
          ),
        ),
      ),
    );
  }
}
