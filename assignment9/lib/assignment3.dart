import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:video_player/video_player.dart';

class Assignment3 extends StatefulWidget {
  @override
  State<Assignment3> createState() => _Assignment3State();
}

class _Assignment3State extends State<Assignment3> {
  //slider
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
    Slide(
        title: "Card, Alert Dialog,\n Icon & Image Widgets",
        styleTitle: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w800,fontSize: 30),
        maxLineTitle: 2,
        description:
            "Flutter App using Card, Alert Dialog, Icon & Image Widgets",
          styleDescription: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass3/Ass31.PNG",
        heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.yellow[700],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Flutter App using card, icon and image widget",
            styleDescription: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass3/Ass31.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.yellow[300],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Alert Dialogue Appears when click on the message button",
            styleDescription: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass3/Ass32.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.yellow[300],
      ),
    );
  }

  void onDonePress() {
    Navigator.popAndPushNamed(context, '/');
  }

  void onSkipPress() {
    // TODO: go to next screen
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.green[800],
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.green[800],
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.green[800],
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.vertical(
      top: Radius.circular(20),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment 3"),
        backgroundColor: Colors.cyan[900],
         actions: [
          IconButton(
              key: const ValueKey<String>('push_tab'),
              icon: const Icon(Icons.video_label),
              onPressed: () {
                Navigator.push<_PlayerVideoAndPopPage>(
                  context,
                  MaterialPageRoute<_PlayerVideoAndPopPage>(
                    builder: (BuildContext context) => _PlayerVideoAndPopPage(),
                  ),
                );
              },
            )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
            Colors.white,
            Color(0xFF80DEEA),
          ], stops: [
            0.0,
            1.0
          ], tileMode: TileMode.clamp),
        ),
        child:  IntroSlider(
              // List slides
              slides: this.slides,

              // Previous button
              renderSkipBtn: this.renderSkipBtn(),
              colorSkipBtn: Color(0x33000000),
              highlightColorSkipBtn: Color(0xff000000),

              // Next, Done button
              onDonePress: this.onDonePress,
              renderNextBtn: this.renderNextBtn(),
              renderDoneBtn: this.renderDoneBtn(),
              colorDoneBtn: Color(0x33000000),
              highlightColorDoneBtn: Color(0xff000000),

              // Dot indicator
              colorDot: Colors.green[300],
              colorActiveDot: Colors.green[800],
              sizeDot: 13.0,
            ),
          ),
    );
  }
}

class _PlayerVideoAndPopPage extends StatefulWidget {
  @override
  _PlayerVideoAndPopPageState createState() => _PlayerVideoAndPopPageState();
}

class _PlayerVideoAndPopPageState extends State<_PlayerVideoAndPopPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
     _controller = VideoPlayerController.network(
      'assets/Ass3.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
    _controller.pause();
  }

  @override
  void dispose() {
     _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Video"),
        backgroundColor: Colors.cyan[900],
        actions: [
          IconButton(
              key: const ValueKey<String>('push_tab'),
              icon: const Icon(Icons.cancel),
              onPressed: () {
                Navigator.pop(context);
              },
            )
        ],
      ),
    body:Center(
    child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
   
  }
}
