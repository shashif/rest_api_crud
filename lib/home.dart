import 'package:flutter/material.dart';
import 'package:rest_api_crud/api_service.dart';
import 'package:rest_api_crud/widget/custom_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _titleEditingController = TextEditingController();
  ApiService apiService = ApiService();
  var tasks = [];



  @override
  void initState() {
    getData();
    super.initState();
  }


  getData() async{
    tasks = await apiService.getAlbum();
    // print(tasks);
  }
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
                  controller: _titleEditingController,
                  decoration: InputDecoration(
                    labelText: 'Task Title',
                    hintText: 'Enter Task Title',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      var  titles= _titleEditingController.text;
                      apiService.sendAlbum(titles);
                      _titleEditingController.clear();

                    },
                    child: Text('Save'),
                  ),
                ),

                ...tasks.map((e)  {
                  return CustomCard(
                    deleteFunction: () {},
                    updateFunction: () {},
                    title: e["title"],
                  );
                })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
