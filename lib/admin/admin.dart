import 'package:flutter/material.dart';
import 'package:newfamly/resources/resusable_widgets.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,

              // Content for the left column
              child: Column(
                children: [
                  // DrawerHeader(child: Image.asset('assets/logo.png')),
                  DrawerListTile(
                      title: "Add Student",
                      iconstart: Icon(Icons.app_blocking_outlined),
                      press: () {}),
                  DrawerListTile(
                      title: "Show Students",
                      iconstart: Icon(Icons.app_blocking_outlined),
                      press: () {})
                  // Add widgets for the left column here
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.white,
                // Content for the right column
                child: Column(
                  children: [
                    Expanded(child: Registration()),
                    // Add widgets for the right column here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.title,
      required this.iconstart,
      required this.press});
  final String title;
  final Icon iconstart;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      title: Text(title),
      leading: iconstart,
    );
  }
}

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _fname = TextEditingController();
    TextEditingController _age = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _p_email = TextEditingController();
    bool _isButtonEnabled = true;

    void _registerStudent() {
      setState(() {
        _isButtonEnabled = false;
      });
      // Repos.instance.createUser(StudentModel(name: _namecontroller.text));
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 20),
        child: ListView(
          padding: const EdgeInsets.all(10),
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 34,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Register Student",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Student Full Name"),
            InputTextForm(
                email: _name,
                text: "Enter Name of Student",
                icon: Icon(Icons.person)),
            const SizedBox(
              height: 15,
            ),
            const Text("Age"),
            InputTextForm(
                email: _age, text: "Enter Age", icon: Icon(Icons.view_agenda)),
            const SizedBox(
              height: 15,
            ),
            const Text("Father/Guardian Name"),
            InputTextForm(
                email: _fname,
                text: "Enter Father Name",
                icon: Icon(Icons.person_4)),
            const SizedBox(
              height: 15,
            ),
            const Text("Parent Email"),
            InputTextForm(
                email: _p_email,
                text: "Enter Parent Email ",
                icon: Icon(Icons.email)),
            const SizedBox(
              height: 15,
            ),
            const Text("Parent Password"),
            InputTextForm(
                email: _password,
                text: "Enter Parent Password",
                icon: Icon(Icons.lock)),
            const Text("Enter Student Picture"),
            GestureDetector(
              child: Container(
                height: size.height * 0.2,
                width: size.width * 0.6,
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Icon(Icons.photo_library_rounded),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: size.width * 0.8,
              child: ElevatedButton(
                  onPressed: _isButtonEnabled ? _registerStudent : null,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      textStyle: const TextStyle(),
                      backgroundColor:
                          _isButtonEnabled ? Colors.blue : Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Row(
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
