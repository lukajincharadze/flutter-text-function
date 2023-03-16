import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var inputController = TextEditingController();
  List<String> products = [];

  List<Widget> productsListView() {
    List<Widget> prods = [];

    for (int i = 0; i < products.length; i++) {
      prods.add(Text(products[i]));
    }

    return prods;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                  children: productsListView(),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                  width: 200,
                  child: TextField(
                    controller: inputController,
                  )),
              TextButton(
                  onPressed: () {
                    setState(() {
                      products.add(inputController.text);
                      inputController.clear();
                    });
                  },
                  child: Text("Add"))
            ],
          )
        ],
      ),
    );
  }
}
