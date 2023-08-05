import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Family App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            moreoption(Icon(Icons.person), "Account",
                Icon(Icons.arrow_forward_ios_outlined)),
            moreoption(Icon(Icons.lock), "Lock Apps",
                Icon(Icons.arrow_forward_ios_outlined)),
            moreoption(
                Icon(Icons.app_settings_alt_rounded),
                "Control Social Media ",
                Icon(Icons.arrow_forward_ios_outlined)),
            moreoption(
                Icon(Icons.browser_updated_sharp),
                "Check Browsing History",
                Icon(Icons.arrow_forward_ios_outlined)),
            moreoption(Icon(Icons.image_search_rounded), "Check Images",
                Icon(Icons.arrow_forward_ios_outlined))
          ],
        ),
      ),
    );
  }
}

moreoption(Icon iconstart, String titl, Icon iconend) {
  return ListTile(
    leading: iconstart,
    title: Text(titl as String),
    trailing: iconend,
  );
}
