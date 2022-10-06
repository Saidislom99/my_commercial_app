import 'package:flutter/material.dart';
import 'package:my_commercial_app/repository/repository.dart';

import '../../../../models/getUser/user.dart';

class UserInfo extends StatelessWidget {
  const UserInfo(
      {Key? key, required this.currentIndex, required this.repository})
      : super(key: key);
  final int currentIndex;
  final MyRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Info"),
        ),
        body: FutureBuilder<UserItem>(
          future: repository.getSingleUser(currentIndex),
          builder: (BuildContext context, AsyncSnapshot<UserItem> snapshot) {
            if (snapshot.hasData) {
              var user = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 300,
                      height: 150,
                      color: Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(user.password),
                          Text(user.username),
                          Text(user.phone),
                          Text(user.email),
                          Text(user.addressItem.zipcode)


                        ],
                      ),
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("E"),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
