import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("What you like to eat?", style: TextStyle(fontSize: 18),),
            ),
              Stack(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.notifications_none),onPressed: (){}),
                  Positioned(
                    top: 12,
                    right: 12,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  ),
                ],
              )
        ],
            ),
            SizedBox(
              height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!,
                      offset: Offset(1,1),
                      blurRadius: 4
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.search, color: Colors.red,),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: "Find food and restaurants",
                      border: InputBorder.none
                    ),
                  ),
                  trailing: Icon(Icons.filter_list, color: Colors.red,),

                ),
              ),
            )

        ]
        ),
      ),
    );
  }
}
