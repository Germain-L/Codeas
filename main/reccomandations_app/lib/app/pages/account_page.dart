import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/login_provider.dart';
import '../../provider/navigation_provider.dart';

class AccountPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    String nameToDisplay =
        loginProvider.user.displayName ?? loginProvider.user.email;
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Switch(
          onChanged: (newState) {
            navigationProvider.changeTheme(newState);
          },
          value: navigationProvider.isLightTheme,
        ),
      )
    );
  }
}
