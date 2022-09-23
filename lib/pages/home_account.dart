import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class HomeAccount extends StatefulWidget {
  const HomeAccount({Key? key}) : super(key: key);
  static const String id="home_account";

  @override
  State<HomeAccount> createState() => _HomeAccountState();
}

class _HomeAccountState extends State<HomeAccount> {

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNamberController = TextEditingController();
  final passwordController = TextEditingController();

  void doLogin(){
    String username = usernameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phoneNumber = phoneNamberController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box=Hive.box("pdp_account");
    box.put("username", username);
    box.put("email", email);
    box.put("phoneNumber", phoneNumber);
    box.put("password", password);

    String name=box.get("username");
    String emaill=box.get("email");
    String phonenumber=box.get("phoneNumber");
    String pw=box.get("password");
    print(name);
    print(emaill);
    print(phonenumber);
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
                child: Text("Create", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 5,),
              Container(
                child: Text("Account", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              ),
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
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "E-Mail",
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.email_outlined, color: Colors.grey,),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: phoneNamberController,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.phone, color: Colors.grey,),
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
              SizedBox(height: 30,),
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
                  Text("Already have an account?", style: TextStyle(color: Colors.grey, fontSize: 20),),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, HomeAccount.id);
                    },
                    child: Text("SIGN IN", style: TextStyle(color: Colors.blue[700], fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
