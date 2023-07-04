import 'dart:convert';

import 'package:api_integration/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  void create (String name, String job) async{

    try{

      Response response = await post(Uri.parse('https://reqres.in/api/users'),
      body: {
        'name' : name,
        'job': job,
      }
      );

      if(response.statusCode == 201){
        var data = jsonDecode(response.body.toString());
        print(data['name']);
        print(data['job']);
        print(data['id']);
        print(data['createdAt']);
        print('User created sucessfully');
      }else{
        print('failed');
      }

      
    }catch(e){
      print(e.toString());

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: jobController,
              decoration: InputDecoration(
                hintText: 'Job',
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                create(nameController.text.toString(), jobController.text.toString());
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));

              },

              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('Next')),
              ),
            )
          ],
        ),
      ),
    );
  }
}