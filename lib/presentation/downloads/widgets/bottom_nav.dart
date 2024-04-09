import 'package:flutter/material.dart';

ValueNotifier<int>IndexChangeNotifire = ValueNotifier(0);
class bottomNavigationWidget extends StatelessWidget {
  const bottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: IndexChangeNotifire, 
    builder: (context, int newIndex, _){
       return  BottomNavigationBar(
      currentIndex: newIndex,
      onTap: (index){
        IndexChangeNotifire.value = index;
      },
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedIconTheme:const IconThemeData(
        color: Colors.white
      ),
      unselectedIconTheme:const IconThemeData(
        color: Colors.grey
      ),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),
      label: 'Home'),

      BottomNavigationBarItem(icon: Icon(Icons.collections),
      label: 'New & Hot'),
      BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions),
      label: 'Fast Laugh'),
      BottomNavigationBarItem(icon: Icon(Icons.search),
      label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.download),
      label: 'Download'),
      

      ],
    );
  },
  );
}

}  
    
   