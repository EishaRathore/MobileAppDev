import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:video_player/video_player.dart';

class Assignment1 extends StatefulWidget {
  @override
  State<Assignment1> createState() => _Assignment1State();
}

class _Assignment1State extends State<Assignment1> {
  //slider
  List<Slide> slides = [];
  //page

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "Prime\\Composite Number",
        description:
            "Flutter App will calculate wheather an integer is prime or composite number",
        pathImage: "assets/Ass1/Ass11.PNG",
        heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.teal,
      ),
    );
    slides.add(
      Slide(
        title: "Output",
        styleTitle: TextStyle(
            color: Colors.pink[800], fontWeight: FontWeight.w800, fontSize: 30),
        description: "User is giving 3 input in a textbox",
        styleDescription: TextStyle(
            color: Colors.pink[800], fontWeight: FontWeight.w400, fontSize: 20),
        pathImage: "assets/Ass1/Ass12.PNG",
        heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.teal[200],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
        styleTitle: TextStyle(
            color: Colors.pink[800], fontWeight: FontWeight.w800, fontSize: 30),
        description:
            "We get an output that 3 is a Composite Number after pressing submit button.",
        styleDescription: TextStyle(
            color: Colors.pink[800], fontWeight: FontWeight.w400, fontSize: 20),
        pathImage: "assets/Ass1/Ass13.PNG",
        heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.teal[200],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
        styleTitle: TextStyle(
            color: Colors.pink[800], fontWeight: FontWeight.w800, fontSize: 30),
        description: "If User gives 7 input in a textbox",
        styleDescription: TextStyle(
            color: Colors.pink[800], fontWeight: FontWeight.w400, fontSize: 20),
        pathImage: "assets/Ass1/Ass14.PNG",
        heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.teal[200],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
        styleTitle: TextStyle(
            color: Colors.pink[800], fontWeight: FontWeight.w800, fontSize: 30),
        description:
            "Then We get an output that 7 is a Prime Number after pressing submit button.",
        styleDescription: TextStyle(
            color: Colors.pink[800], fontWeight: FontWeight.w400, fontSize: 20),
        pathImage: "assets/Ass1/Ass15.PNG",
        heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.teal[200],
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
      color: Color(0xffD02090),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffD02090),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffD02090),
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.vertical(
      top: Radius.circular(20),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment 1"),
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
      body: IntroSlider(
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
                colorDot: Color(0x33D02090),
                colorActiveDot: Color(0xffD02090),
                sizeDot: 13.0,
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
      'assets/Ass1.mp4',
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
