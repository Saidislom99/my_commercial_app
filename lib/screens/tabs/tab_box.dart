import 'package:flutter/material.dart';
import 'package:my_commercial_app/screens/tabs/tab_screens/cart.dart';
import 'package:my_commercial_app/screens/tabs/tab_screens/home.dart';
import 'package:my_commercial_app/screens/tabs/tab_screens/user/user.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int currentIndex=0;


  List<Widget> screens=[
     Home(),
     CartScreen(),
     User()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        iconSize: 24,
        onTap: (index){
          setState((){
            currentIndex=index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.red),
        items: [
          getItem(icon: Icons.home, labetText: "Home", ),
          getItem(icon: Icons.card_travel, labetText: "Cart"),
          getItem(icon: Icons.person, labetText: "User")
        ],
      ),
    );
  }


  BottomNavigationBarItem getItem({
  required IconData icon, required String labetText
}) => BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.black,),
      label: labetText

  );

}
