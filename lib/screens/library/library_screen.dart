import 'package:flutter/material.dart';
import 'package:project_cobalt/screens/main/components/header.dart';

import '../../constants.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({ Key? key }) : super(key: key);

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
                
              ],
            )
          ],
        )
      )
    );
  }
}
