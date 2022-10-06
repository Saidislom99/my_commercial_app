import 'package:flutter/material.dart';
import 'package:my_commercial_app/repository/repository.dart';
import 'package:my_commercial_app/service/api_provider.dart';
class MyTask extends StatefulWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {

  var provider = ApiProvider();

  final TextEditingController userName=TextEditingController();
  final TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: userName,
            decoration: InputDecoration(
              hintText: "Username",
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          TextButton(onPressed: ()async{
            String UserName= userName.text;
            String Password= password.text;
            var t= await provider.loginUser(password: Password, username: UserName);
           await MyRepository.saveToken(token: t);
           print(t);

          },
              child: Text("Login"))
          // mor_2314   83r5^_
        ],
      ),
    );
  }
}
