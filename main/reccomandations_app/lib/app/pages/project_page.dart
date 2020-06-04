import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/models/project_template.dart';
import 'package:reccomandations_app/provider/navigation_provider.dart';
import 'package:reccomandations_app/provider/project_provider.dart';
import 'package:reccomandations_app/widgets/project_cards.dart';

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Container();
  }
}
