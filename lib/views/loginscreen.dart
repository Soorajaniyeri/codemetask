import 'package:codememachinetest/controllers/login_controlller.dart';
import 'package:codememachinetest/widgets/button_design.dart';
import 'package:codememachinetest/widgets/textfield_design.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<LoginController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover, image: AssetImage("assets/lg.png")),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(140)),
                  border: Border.all(color: Colors.black)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldDesign(hintText: "Username", controller: obj.userNameCtrl),
            TextFieldDesign(hintText: "password", controller: obj.pasCtrl),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Forgot your"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Password?",
                      style: TextStyle(color: Colors.blue.shade900),
                    )),
                const SizedBox(
                  width: 28,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonDesign(
                loading: obj.loading,
                buttonText: "Sign in",
                onTap: () {
                  // loginUser(userNameCtrl.text, pasCtrl.text);
                  obj.loginUser(
                      obj.userNameCtrl.text, obj.pasCtrl.text, context);
                }),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account ?"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue.shade900),
                    )),
                const SizedBox(
                  width: 28,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
