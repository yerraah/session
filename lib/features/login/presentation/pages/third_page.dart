import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final String imageUrl;
  final String username;

  StoryWidget({
    required this.imageUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenStory(
              highResImageUrl: imageUrl,
              username: username,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            username,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class FullScreenStory extends StatelessWidget {
  final String highResImageUrl;
  final String username;

  FullScreenStory({
    required this.highResImageUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              child: Center(
                child: Image.network(
                  highResImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 16.0,
              left: 16.0,
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StorisPage extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {
      'imageUrl': 'https://placekitten.com/700/800',
      'username': '2011273',
    },
    {
      'imageUrl': 'https://placekitten.com/700/801',
      'username': '1910727',
    },
    {
      'imageUrl': 'https://placekitten.com/701/800',
      'username': '1890345',
    },
    {
      'imageUrl': 'https://placekitten.com/701/801',
      'username': '2210321',
    },
    {
      'imageUrl': 'https://placekitten.com/702/800',
      'username': '2109232',
    },
    {
      'imageUrl': 'https://placekitten.com/708/800',
      'username': '1610901',
    },
    {
      'imageUrl': 'https://placekitten.com/709/800',
      'username': '1711081',
    },
    {
      'imageUrl': 'https://placekitten.com/210/300',
      'username': '1804661',
    },
    {
      'imageUrl': 'https://placekitten.com/211/300',
      'username': '1901401',
    },
    {
      'imageUrl': 'https://placekitten.com/212/300',
      'username': '2002301',
    },

    // Другие истории добавляются аналогично
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stories'),
        backgroundColor: Color(0xFF1C7E66),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: stories.asMap().entries.map((entry) {
            final index = entry.key;
            final story = entry.value;
            return Padding(
              padding: EdgeInsets.all(8),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: index % 2 == 0 ? Colors.white : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: StoryWidget(
                  imageUrl: story['imageUrl']!,
                  username: story['username']!,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stories App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StorisPage(),
    );
  }
}
