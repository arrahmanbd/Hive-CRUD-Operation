import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Access to the Open Box/collection
  Box DemoBox = Hive.box('DemoBox');
  //Create a key
  String? name = 'This Value Will Change';

//function for adding to the box
  addFriend() async {
    await DemoBox.put('name', 'Flutter Hive');
    
  }

//read from the box
  readFriend() async {
    //put it on setstate to get the update value
    setState(() {
      name = DemoBox.get('name');
     
    });
  }

//update box value
  updateFriend() async {
    await DemoBox.put('name', 'Text Updated');
  }

//delete from the box
  deleteFriend() async {
    await DemoBox.delete('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive DB'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$name',
              style: TextStyle(fontSize: 32),
            ),
          
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: addFriend, child: Text('Create')),
            ElevatedButton(onPressed: readFriend, child: Text('Read')),
            ElevatedButton(onPressed: updateFriend, child: Text('Update')),
            ElevatedButton(onPressed: deleteFriend, child: Text('Delete'))
          ],
        ),
      ),
    );
  }
}
