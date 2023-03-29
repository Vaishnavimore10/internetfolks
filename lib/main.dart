import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:internetfolks/model.dart';
import 'package:internetfolks/services.dart';






void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  String? stringresponse;
  Map? mapresponse;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final response =
    await  http.get(Uri.parse('https://sde-007.api.assignment.theinternetfolks.works/v1/event'));
    if (response.statusCode == 200) {
      setState(() {
        //stringresponse = response.body;
        mapresponse = jsonDecode(response.body);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            'Events',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded,color: Colors.black,size: 30,),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert,color: Colors.black,size: 30,),
            onPressed: () {
              // TODO: Implement notification functionality
            },
          ),
        ],
      ),
      body: ListView.builder(itemCount:mapresponse!['content']['data'.length],itemBuilder:(context,index) {
        return MyCard(imageUrl: mapresponse!['content']['data'][index]['organiser_icon'], description: mapresponse!['content']['data'][index]['description'],title:mapresponse!['content']['data'][index]['title'] ,date_time: mapresponse!['content']['data'][index]['date_time'],venue: mapresponse!['content']['data'][index]['venue_name'],image: mapresponse!['content']['data'][index]['banner_image'] ,);

      },
      ),
      );


  }
}


class MyCard extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String title;
  final String date_time;
  final String venue;
  final String image;

  MyCard({required this.imageUrl, required this.description,required this.title,required this.date_time,required this.venue,required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyCard(
              imageUrl: imageUrl,
              title: title,
              description: description,
              date_time: date_time,
              venue: venue,
              image: image,
            ),
          ),
        );
      },
      child: Card(
      child: Row(
        children: [
          // Display the image on the left side of the card
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Display the description on the right side of the card
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.0),
                  Text(description),
                  SizedBox(height: 8.0),
                  Text(date_time),
                  SizedBox(height: 8.0),
                  Text(venue),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}



