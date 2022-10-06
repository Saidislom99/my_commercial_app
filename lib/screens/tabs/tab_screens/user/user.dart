import 'package:flutter/material.dart';
import 'package:my_commercial_app/repository/repository.dart';
import 'package:my_commercial_app/screens/tabs/tab_screens/user/user_info.dart';

import '../../../../local_data/local_database.dart';
import '../../../../models/getUser/user.dart';
import '../../../../service/api_provider.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _HomeState();
}

class _HomeState extends State<User> {

  late MyRepository myRepository;

  List<UserItem> userItem=[];

  @override
  void initState() {
  _init();
    super.initState();
  }

  void _init() async{
    myRepository = MyRepository(
      apiProvider: ApiProvider(),
      localDatabase: LocalDatabase(),
    );

    userItem= await myRepository.getAllUser();
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(title: Text("User"),
      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: List.generate(userItem.length, (index) => GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return UserInfo(currentIndex:userItem[index].id, repository: myRepository,);
            }));
          },
          child: Container(
            margin: EdgeInsets.all(15),
            width: 200,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(24))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userItem[index].username, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22, color: Colors.purple),),
                    Text(userItem[index].nameItem.firstname, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14,),),
                    Text(userItem[index].nameItem.lastname, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14,),),
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text("Phone:${userItem[index].phone}"),
                   Text("Email:${userItem[index].email}"),
                 ],
                ),
                Expanded(child: SizedBox()),
                Text("ID:${userItem[index].id}", style:  TextStyle(color: Colors.blueAccent))

              ],
            ),
          ),
        )),
      )
    );
  }
}
