import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
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
              height: 20,
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
                Text(
                  "Perth, Western Australia",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            const Center(
              child: Icon(
                Icons.home,
                color: Colors.blue,
                size: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Welcome back, you’ve been missed!"),
            const SizedBox(
              height: 60,
            ),
            const Text("Username or Email"),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Username",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  prefixIcon: Icon(Icons.person)),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Password"),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: ".......",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  prefixIcon: Icon(Icons.lock)),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              width: size.width * 0.8,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      textStyle: const TextStyle(),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Row(
                    children: [
                      Text(
                        'SIGN IN',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward)
                    ],
                  )),
            ),
            // const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {},
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Constact Us",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black),
                        ))),
                const SizedBox(height: 25),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.facebook),
                label: const Text(
                  "Sign In with Facebook",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ))
          ],
        ),
      ),
    );
  }
}
