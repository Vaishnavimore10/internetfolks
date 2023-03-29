import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EventDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String time;
  final String venue;
  final String description;
  final String image;


  EventDetailsPage({
    required this.imageUrl,
    required this.name,
    required this.time,
    required this.venue,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          // Display the image on the top half of the screen
          Expanded(
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          // Display the text information on the bottom half of the screen
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Time: $time',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Venue: $venue',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
