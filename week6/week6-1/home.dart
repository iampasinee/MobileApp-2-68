import 'package:flutter/material.dart';
import 'shopping.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Bar")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  newBTN(context),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return formShopping();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20.0),
                      fixedSize: Size(300, 70),
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      elevation: 7,
                      shadowColor: Colors.blue,
                      side: BorderSide(color: Colors.blue[800]!, width: 1),
                      shape: StadiumBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Go To Shopping"),
                        Icon(Icons.add_shopping_cart_outlined, size: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton newBTN(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Alert Dialog Title"),
          content: Text("Alert Dialog Description"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text("OK"),
            ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20.0),
        fixedSize: Size(300, 70),
        textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 7,
        shadowColor: Colors.blue,
        side: BorderSide(color: Colors.blue[800]!, width: 1),
        shape: StadiumBorder(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Let's Begin"),
          Icon(Icons.add_shopping_cart_outlined, size: 40),
        ],
      ),
    );
  }
}
