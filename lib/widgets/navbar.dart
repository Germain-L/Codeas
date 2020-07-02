import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/navigation_provider.dart';


class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Container(
      color: Theme.of(context).canvasColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(MdiIcons.home),
                onPressed: () {
                  navigationProvider.changePage("/home", "Home");
                },
              ),
              IconButton(
                icon: Icon(MdiIcons.plus),
                onPressed: () {
                  navigationProvider.changePage("/newProject", "Post a new project");
                },
              ),
              IconButton(
                icon: Icon(MdiIcons.account),
                onPressed: () {
                  navigationProvider.changePage("/account", "Account");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}