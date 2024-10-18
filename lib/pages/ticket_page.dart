import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {

   final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _typeController = TextEditingController();
  final _severityController = TextEditingController();


   Future<void> _submitForm() async {

   // if (_formKey.currentState!.validate()) {
   print(_formKey.currentState);
      print(_nameController.text);
      print(_descriptionController.text);
      print(_typeController.text);
      print(_severityController.text);
      final response = await http.post(
        Uri.parse('https://hennagara-backend.onrender.com/tickets/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': _nameController.text,
          'description': _descriptionController.text,
          'type':_typeController.text,
          'severity':_severityController.text,
          'reportedBy': '672ehuey72y3'
        }),
      );
      print(response);

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data submitted successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit data')),
        );
      }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        foregroundColor: Colors.white,
        title:const Text(""),
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
              const Text("New Ticket",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: Responsive.isMobile(context)
                  ? Responsive.widthOfScreen(context) * 0.9
                  : Responsive.widthOfScreen(context) * 0.8,
                child: DecoratedBox(
                  decoration:BoxDecoration(
                    boxShadow:const[  BoxShadow(
                      color: Colors.blue,
                      blurRadius: 4,
                      spreadRadius: 2),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              
              ),
              child: Padding(padding: EdgeInsets.all(20),
              child: Column(children: [
                //TextFormField("Issue Type", 1, "Your issues..."),
                 TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
               // contactFormField("Name", 1, "Your Name"),
               // contactFormField("Severity", 1, ""),
               // contactFormField("Description", 12,""),
                TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),

               TextFormField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Query';
                  }
                  return null;
                },
              ),
               TextFormField(
                controller: _severityController,
                decoration: InputDecoration(labelText: 'severity'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please Enter severity';
                  }
                  return null;
                },
              ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: _submitForm,
                        child: Text("Submit", style: TextStyle(color: Colors.white),),
                    ),
                    ),
                  ],
                )
              ],
              ),
              ),
              
               ),
                ),
                
              ],
                ),
          ),
              ),
            
          ),
    );
  }

  contactFormField(name, maxLine, hintText){
    return Padding(padding:const EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name, 
          style:const TextStyle(
            fontSize: 18,
             color: Colors.blue, 
             fontWeight: FontWeight.bold,
             ),
             ),
             Padding(
              padding:const EdgeInsets.symmetric(vertical: 8),
             child: TextField(
              maxLines: maxLine,
              decoration: InputDecoration(
                hintText: hintText,
                border:const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    ),
                    ),
                    contentPadding:const EdgeInsets.symmetric(
                      horizontal: 5,
                       vertical: 2
                       ),
                ),
                ),
             ),
             ],
    ),
    );
  }
}