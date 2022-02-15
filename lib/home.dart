import 'package:flutter/material.dart';
import 'package:raahee_assignment/post.dart';
import 'dart:io';
import 'postDetails.dart';

class Home extends StatefulWidget {
  PostDetail? pd;
  final PageController controller;

  Home({Key? key, this.pd, required this.controller}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  redirectToPost(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostDetails(pd: widget.pd)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(child: Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                margin: const EdgeInsets.only(left: 16.0, top: 16.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/images/pic1.jfif'),
                    ),
                  ),
                  const Text(
                    '@dhimsrasyad',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]))),
        Padding(
          padding: EdgeInsets.only(right: 16.0, top: 16.0),
          child: Icon(Icons.notifications_active_outlined),
        ),
      ]),
      const SizedBox(
        height: 25.0,
      ),
      Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/pic2.jfif",
            width: 350,
            height: 450,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 100,
          right: 0,
          child: RawMaterialButton(
            onPressed: () => redirectToPost(context),
            elevation: 2.0,
            fillColor: Colors.white.withOpacity(0.1),
            child: const Icon(
              Icons.favorite_outlined,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10.0),
            shape: const CircleBorder(),
          ),
        ),
        const Positioned(
          top: 150,
          right: 40,
          child: Text(
            "7",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 175,
          right: 0,
          child: RawMaterialButton(
            onPressed: () => redirectToPost(context),
            elevation: 2.0,
            fillColor: Colors.white.withOpacity(0.1),
            child: const Icon(
              Icons.comment_outlined,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10.0),
            shape: const CircleBorder(),
          ),
        ),
        const Positioned(
          top: 225,
          right: 40,
          child: Text(
            "3",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 250,
          right: 0,
          child: RawMaterialButton(
            onPressed: () => redirectToPost(context),
            elevation: 2.0,
            fillColor: Colors.white.withOpacity(0.1),
            child: const Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10.0),
            shape: const CircleBorder(),
          ),
        ),
        Positioned.fill(
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  width: 340,
                  height: 50,
                  child: Text(
                    "A beautiful evening by the beach...",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          /*top: 350,
            left: 10,
            child: Text(widget.pd!.caption),*/
        ),
      ]),
      if (widget.pd != null)
        Stack(children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                File(widget.pd!.image.path),
                width: 350,
                height: 450,
                fit: BoxFit.cover,
              )),
          Positioned(
            top: 100,
            right: 0,
            child: RawMaterialButton(
              onPressed: () => redirectToPost(context),
              elevation: 2.0,
              fillColor: Colors.white.withOpacity(0.1),
              child: const Icon(
                Icons.favorite_outlined,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(10.0),
              shape: const CircleBorder(),
            ),
          ),
          Positioned(
          top: 150,
          right: 40,
          child: Text(
            widget.pd!.likes.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
          Positioned(
            top: 175,
            right: 0,
            child: RawMaterialButton(
              onPressed: () => redirectToPost(context),
              elevation: 2.0,
              fillColor: Colors.white.withOpacity(0.1),
              child: const Icon(
                Icons.comment_outlined,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(10.0),
              shape: const CircleBorder(),
            ),
          ),
          Positioned(
          top: 225,
          right: 40,
          child: Text(
            widget.pd!.likes.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
          Positioned(
            top: 250,
            right: 0,
            child: RawMaterialButton(
              onPressed: () => redirectToPost(context),
              elevation: 2.0,
              fillColor: Colors.white.withOpacity(0.1),
              child: const Icon(
                Icons.share_outlined,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(10.0),
              shape: const CircleBorder(),
            ),
          ),
          Positioned.fill(
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Container(
                  width: 340,
                  height: 50,
                  child: Text(
                     widget.pd!.caption,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),)))
        ])
    ])));
  }
}
