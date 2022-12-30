import 'package:flutter/material.dart';
import 'package:rest_api_crud/widget/custom_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API CRUD'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextField(
                  // controller:,
                  decoration: InputDecoration(
                    labelText: 'Task Title',
                    hintText: 'Enter Task Title',

                  ),

                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('Save'),
                  ),
                ),

                CustomCard(
                  deleteFunction: (){},
                  updateFunction: (){},
                  title: "Hello Bangladesh",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


