import 'package:flutter/material.dart';
import 'post.dart';
import 'home.dart';
import 'package:image_picker/image_picker.dart';

Future pickImage(BuildContext context, controller) async {
  final ImagePicker _picker = ImagePicker();
  XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Post(data: image, controller: controller,)),
  );
  //controller.jumpToPage(1);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 255, 254, 254)),
      home: MyNavigationBar(title: ""),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  PostDetail? pd;
  MyNavigationBar({Key? key, required this.title, this.pd}) : super(key: key);

  String title;

  @override
  _MyNavigationBar createState() => _MyNavigationBar();
}

class _MyNavigationBar extends State<MyNavigationBar> {
  late PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Home(pd: widget.pd, controller: _pageController),
          Post(controller: _pageController),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home_outlined,
                color: Colors.grey.shade400,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Icon(
                  Icons.search_outlined,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Icon(
                  Icons.email_outlined,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.person_outline,
                color: Colors.grey.shade400,
              ),
            ),
          ],
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          iconSize: 26,
          elevation: 50),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue[200],
        onPressed: () => pickImage(context, _pageController),
        tooltip: 'Add post',
        child: const Icon(Icons.add),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
