import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<String> _imageUrls = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchInstagramImages();
  }

  Future<void> _fetchInstagramImages() async {
    // Replace with your actual Instagram API endpoint and access token
    final response = await http.get(Uri.parse(
        'https://graph.instagram.com/rashadthewizard/media?fields=id,media_url&access_token=YOUR_ACCESS_TOKEN'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<String> imageUrls = (data['data'] as List)
          .map((media) => media['media_url'] as String)
          .toList();
      setState(() {
        _imageUrls = imageUrls;
        _isLoading = false;
      });
    } else {
      // Handle error
      print('Failed to load images');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Social Media Gallery")),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: _imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    _imageUrls[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
    );
  }
}
