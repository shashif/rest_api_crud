import 'package:flutter/material.dart';
import 'package:rest_api_crud/api_service.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({required this.id, required this.title});

  final String title;
  final String id;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final ApiService apiService = ApiService();
  late TextEditingController _titleEditingController;

  @override
  void initState() {
    _titleEditingController = TextEditingController(text: widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Taks Title'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: _titleEditingController,
                decoration: InputDecoration(
                  labelText: 'Task Title',
                  hintText: 'Enter task tile',
                ),
                autofocus: true,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    apiService.updateAlbum(widget.title, widget.id);
                  },
                  child: Text('Update'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
