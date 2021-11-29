import 'package:project_cobalt/responsive.dart';
import 'package:flutter/material.dart';
import 'package:project_cobalt/screens/main/components/header.dart';
import 'package:project_cobalt/screens/home/components/my_works.dart';
import 'package:project_cobalt/screens/home/components/recent_files.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiles(),
                      SizedBox(height: defaultPadding),
                      RecentFiles(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
              ],
            )
          ],
        )
      )
    );
  }
}
