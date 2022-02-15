import 'package:flutter/material.dart';
import 'post.dart';
import 'dart:io';

class PostDetails extends StatefulWidget {
  PostDetail? pd;
  PostDetails({Key? key, required this.pd}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  Color _iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
        body: Column(children: [Stack(clipBehavior: Clip.none,
        children: <Widget>[
      Image.file(
        File(widget.pd!.image.path),
        height: 400,
        fit: BoxFit.cover,
      ),
      const Positioned(
        top: 370,
        left: 20,
        child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/pic1.jfif'),
                    ),
      ),
      const Positioned(top: 420,
      left: 110,
      child: Text("Michelle Jonas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),]),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        TextButton(
          child: Icon(
            Icons.favorite,
            color: _iconColor,
          ),
           onPressed: ()=> {
                        setState(() {
                          if(_iconColor == Colors.grey){
                            _iconColor = Colors.red;
                          }else{
                        _iconColor = Colors.grey;
                    }
               },)}
        ),
        TextButton(
          onPressed: () {},
          child: const Icon(
            Icons.share,
            color: Colors.grey,
          ),
        ),
      ]),
      Expanded(
        flex: 7,
        child: Container(),
      ),
      Expanded(
        flex: 3,
        child: Container(
        color: Color.fromARGB(255, 233, 232, 232),
        height: 0,
        child: Row(
        children: <Widget>[
    const Expanded(
      flex: 2, // takes 30% of available width 
      child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/pic1.jfif'),
                    ),
    ),
    Expanded(
      flex: 8, // takes 70% of available width  
      child: Padding(padding: const EdgeInsets.only(right: 16), child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            labelText: 'Write Comment Here...',
            //border: OutlineInputBorder(
                    //borderRadius: BorderRadius.circular(30)),
            enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromARGB(255, 233, 232, 232), width: 0.0),
      borderRadius: BorderRadius.circular(30),
    ),
    fillColor: Colors.white, filled: true,
          ),
          style: const TextStyle(height: 0.2,),
        ),
    ),),
  ],  ),),)]))  ;
  }
}
