import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:video_player/video_player.dart';


class Assignment5 extends StatefulWidget {
  @override
  State<Assignment5> createState() => _Assignment5State();
}

class _Assignment5State extends State<Assignment5> {
  //slider
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
Slide(
        title: "WEB API Integration",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description: "Home Screen, add logo and add drawer for navigation options to screens widgets are used in this Flutter App. Screen to Add Record & Integrate Web API to add records. Screen to List Records.Integrate Web API to fetch records and then display List is shown in tabular form, in this screen",
           marginDescription: const EdgeInsets.only(left: 20.0, right: 20.0),
           styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass5/Ass51.PNG",
        heightImage: 380,
        widthImage: 220,
        backgroundColor: Color(0xFF8e247d),
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Main Screen with description",
            styleDescription: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass5/Ass51.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
     slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Screen with drawer having Add Record and Show Record Screens",
            styleDescription: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass5/Ass52.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
     slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Add Record Screen",
            styleDescription: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass5/Ass53.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
     slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "User is giving required input",
            styleDescription: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass5/Ass54.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
     slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "When the Record Button is pressed using web Api integration Record is Added Successfully and alert box apears.",
            styleDescription: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass5/Ass55.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.white,
      ),
    );
     slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Added Record is Shown in The Screen View Record.",
            styleDescription: TextStyle(color: Color(0xFF8e247d), fontWeight: FontWeight.w400,fontSize: 20, ),
        pathImage: "assets/Ass5/Ass56.PNG",
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
      color: Color(0xFF301934),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color:Color(0xFF301934),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xFF301934),
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.vertical(
      top: Radius.circular(20),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment 5"),
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
              colorDot: Color(0x33D02090),
              colorActiveDot: Color(0xFF301934),
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
      'assets/Ass5.mp4',
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
