import 'package:app_onboarding/data/data.dart';
import 'package:app_onboarding/data/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;

  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    _controller = PageController(initialPage: slideIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 100,
              child: PageView.builder(
                  itemCount: mySLides.length,
                  onPageChanged: (index) {
                    setState(() {
                      slideIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return SlideTile(
                      imagePath: mySLides[index].getImageAssetPath(),
                      title: mySLides[index].getTitle(),
                      desc: mySLides[index].getDesc(),
                    );
                  }),
            ),
            Spacer(),
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: slideIndex == 0 ? Colors.blue : Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: slideIndex == 1 ? Colors.blue : Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: slideIndex == 2 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(slideIndex);
                        },
                        child: Container(
                            child:
                                slideIndex == 0 ? Container() : Text("BACK")),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            if (slideIndex == mySLides.length - 1) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Main(),
                                  ));
                            }
                          },
                          child: Text(slideIndex == mySLides.length - 1
                              ? "FINISH"
                              : "NEXT"))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(title),
          SizedBox(
            height: 40,
          ),
          Text(desc)
        ],
      ),
    );
  }
}

class indexIndicator extends StatelessWidget {
  int index, length;

  indexIndicator({this.index, this.length});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == 0 ? Colors.blue : Colors.grey),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == 1 ? Colors.blue : Colors.grey),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == 2 ? Colors.blue : Colors.grey),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child:
                    Container(child: index == 0 ? Container() : Text("BACK")),
              ),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    if (index == length - 1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Main(),
                          ));
                    }
                  },
                  child: Text(index == length - 1 ? "FINISH" : "NEXT"))
            ],
          ),
        )
      ],
    );
  }
}
