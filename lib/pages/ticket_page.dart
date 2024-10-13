import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
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
                contactFormField("Issue Type", 1, "Your issues..."),
                contactFormField("Name", 1, "Your Name"),
                contactFormField("Severity", 1, ""),
                contactFormField("Description", 12,""),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: (){}, 
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