import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/team.dart';
import 'package:http/http.dart' as http;

class Getapi extends StatefulWidget {
   Getapi({super.key});

  @override
  State<Getapi> createState() => _GetapiState();
}

class _GetapiState extends State<Getapi> {
  @override
  void initState() {
    getTeams();
  }

List<Team> teams = [];

//get data from api
  Future getTeams() async {
    var response = await http.get(Uri.https('hennagara-backend.onrender.com','/tickets'));
    var jsonData = jsonDecode(response.body);
    print(jsonData.length);
    for(var eachTeam in jsonData){
      Team team = Team(
        id: eachTeam['id'] , 
        name:eachTeam['name'], 
        type: eachTeam['type'],
        severity: eachTeam['severity'],
         reportedBy: eachTeam['reportedBy'],
         resolvedOn: eachTeam['resolvedOn'],
         createdOn: eachTeam['createdOn'],
         status: eachTeam['status'],
         stage: eachTeam['stage'],
         uniqueId: eachTeam['uniqueId'],
         );
         teams.clear();
         teams.add(team);
         print("Inside for");
         print(teams);
    }
  }

  @override
  Widget build(BuildContext context) {
    //getTeams();
    return Scaffold(
      appBar: AppBar(
        title: Text(" Tickets"),
        backgroundColor: Colors.blue,
      ),
     
      body: FutureBuilder(
        future: getTeams(),
         builder: (context, snapshot){
          //if done loading then show data
          if (snapshot.connectionState == ConnectionState.done){
            print(teams.length);
            return ListView.builder(
              itemCount: teams.length,
              itemBuilder: (context, index){
              return Center(
                child: Card(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[ ListTile(
                      title: Text(teams[index].name),
                      subtitle: Text(teams[index].type) ,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){}, child: Text(teams[index].severity)),
                      ],
                    )
                    ]
                  ),
                ),
              );
            });
          }
          //if not then show loading circle
          else{
            return Center(child: CircularProgressIndicator(),);
          }
         },
         ),
    );
  }
}