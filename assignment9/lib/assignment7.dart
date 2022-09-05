import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:video_player/video_player.dart';

class Assignment7 extends StatefulWidget {
  @override
  State<Assignment7> createState() => _Assignment7State();
}

class _Assignment7State extends State<Assignment7> {
  //slider
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
Slide(
        title: "Flutter Forms",
        description:
            "Flutter App with simple form, better form withtextFromField and validating Form. Also along with appropriate validating constraints(Not Null, valid email, 11-digits mobile phone, password length >=5, containing digits & alphabets, checkbox must be checked are implemented",
          
        pathImage: "assets/Ass7/Ass71.PNG",
        heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.deepPurple[300],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Simple Form",
            styleDescription: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass7/Ass71.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.deepPurple[100],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Form with textFormField",
            styleDescription: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass7/Ass72.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.deepPurple[100],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "User is Giving input in TextFormField",
            styleDescription: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass7/Ass74.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.deepPurple[100],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "When Send Button Will be Pressed then a message will be Shown that ' Your message is sent '",
            styleDescription: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass7/Ass73.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.deepPurple[100],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Validating Form",
            styleDescription: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass7/Ass75.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.deepPurple[100],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Flutter Form will Show Following Errors if Validation will not be fullfilled and Register Button is pressed.",
            styleDescription: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass7/Ass76.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.deepPurple[100],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "As You Can See as we didn't let textFormfield empty its error is fininshed.",
            styleDescription: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass7/Ass77.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.deepPurple[100],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Password length validation is giving error in this form",
            styleDescription: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass7/Ass78.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.deepPurple[100],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Now All the Validations are fulfilled that's why no error will occur",
            styleDescription: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass7/Ass79.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.deepPurple[100],
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
      color: Colors.grey[700],
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.grey[700],
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.grey[700],
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.vertical(
      top: Radius.circular(20),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment 7"),
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
      'assets/Ass7.mp4',
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
