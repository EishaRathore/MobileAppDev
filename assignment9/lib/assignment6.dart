import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:video_player/video_player.dart';

class Assignment6 extends StatefulWidget {
  @override
  State<Assignment6> createState() => _Assignment6State();
}

class _Assignment6State extends State<Assignment6> {
  //slider
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
Slide(
        title: "Capture Image from mobile camera or gallery, show and upload on web-server via REST API",
           styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 24),
     maxLineTitle: 3,
        description:
            "Flutter Screen, to show and image preview, when it is clicked/tabbed, provided two options [Gallery, Camera].Then Select from Mobile Gallery/Capture from Mobile Camera. After selection/capturing it is shown in a circular image widget. Image type Constraints [.bmp/jpeg/etc] and file size constraint {i.e size <=2kb/mb} and compress option is also implemented in it.",
           styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
     
        pathImage: "assets/Ass6/Ass61.PNG",
        heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.purple[800],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Flutter Home Screen With a circular image",
            styleDescription: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass6/Ass61.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "When a Circular Image is Clicked/tabbed it shows three Options [Camera, Gallery, Upload]",
            styleDescription: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass6/Ass62.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Then If we Clicked Gallery it will ask for permission If User Allow it then the app Can access the mobile gallery",
            styleDescription: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass6/Ass63.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "After Selecting the Image from gallery it will be shown in a circular image widget.",
            styleDescription: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass6/Ass64.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "If We Again Press The Selected Image, Three Options Will be Shown.",
            styleDescription: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass6/Ass65.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "If the Upload Option Will be Select By Selected Image Then It Will Be Uploaded to The Server via REST API ",
            styleDescription: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass6/Ass66.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Then If we Clicked Camera this time it will ask for permission If User Allow it then the app Can access the mobile camera",
            styleDescription: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass6/Ass67.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Camera is Open Now Capture thr image using camera",
            styleDescription: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass6/Ass68.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "If we Clicked an image from camera and done it, then image will be shown in a circular image widget",
            styleDescription: TextStyle(color: Color(0xFF301934), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass6/Ass69.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
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
      color: Colors.purpleAccent,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.purpleAccent,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.purpleAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.vertical(
      top: Radius.circular(20),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment 6"),
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
      'assets/Ass6.mp4',
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
