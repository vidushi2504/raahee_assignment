import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'main.dart';

class PostDetail {
  late XFile image;
  String caption = "";
  int likes = 0;
  List<String> comments=[];
  PostDetail(image, caption) {
    this.image = image;
    this.caption = caption;
  }
}

class Post extends StatefulWidget {
  final XFile? data;
  final PageController controller;
  const Post({Key? key, this.data, required this.controller}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String caption = "";

  void postImage(controller, image, caption) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyNavigationBar(
                title: "",
                pd: PostDetail(image, caption),
              )),
    );
    //controller.jumpToPage(0);
    //navigationTapped();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
                child: Column(children: [
              const SizedBox(
                height: 50.0,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    File(widget.data!.path),
                    width: 300,
                    height: 400,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter a caption',
                  ),
                  onChanged: (value) => caption = value,
                ),
              ),
              TextButton(
                  onPressed: () =>
                      postImage(widget.controller, widget.data, caption),
                  child: const Text("Post")),
            ]))));
  }
}
