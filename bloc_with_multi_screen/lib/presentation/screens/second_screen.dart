import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1",
              style: TextStyle(
                fontSize: 40,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.minimize),
                ),
              ],
            ),
            MaterialButton(
              onPressed: () {},
              child: Container(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Go to First Page"),
              ),
              color: Colors.purple,),
            ),
          ],
        ),
      ),
    );
  }
}
