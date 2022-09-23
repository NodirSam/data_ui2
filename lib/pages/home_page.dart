import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'home_account.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id="home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void doLogin(){
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box=Hive.box("pdp");
    box.put("username", username);
    box.put("password", password);

    String name=box.get("username");
    String pw=box.get("password");
    print(name);
    print(pw);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("assets/images/images.jpg"),
                  fit: BoxFit.cover,
                )
              ),
            ),
            SizedBox(height: 20,),
            Text("Welcome Back!", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text("Sign in to continue", style: TextStyle(color: Colors.grey[500], fontSize: 20),),
            SizedBox(height: 20,),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "User Name",
                hintStyle: TextStyle(color: Colors.grey),
                icon: Icon(Icons.person, color: Colors.grey,),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey),
                icon: Icon(Icons.lock, color: Colors.grey,),
              ),
            ),
            SizedBox(height: 20,),
            Text("Forgot Password?", style: TextStyle(color: Colors.grey, fontSize: 18),),
            SizedBox(height: 25,),
            Container(
              height: 70,
              width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.lightBlue
                ),
              child: TextButton(
                onPressed: (){
                  doLogin();
                },
                child: Icon(Icons.arrow_forward, size: 50, color: Colors.white,),
              )
            ),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(color: Colors.grey, fontSize: 20),),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, HomeAccount.id);
                  },
                  child: Text("SIGN UP", style: TextStyle(color: Colors.blue[700], fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
