import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:video_player/video_player.dart';

class Assignment8 extends StatefulWidget {
  @override
  State<Assignment8> createState() => _Assignment8State();
}

class _Assignment8State extends State<Assignment8> {
  //slider
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
Slide(
        title: "Tab Bar App",
        description:
            "Tab Bar App Demonstrated with Buttons and Input & Selection Widgets Demo",
          
        pathImage: "assets/Ass8/Ass81.PNG",
        heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[900],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Home Screen with Drawer and Description.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass81.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Expanded Drawer",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass82.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Part 1 Screen with Five Buttons Implementation",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass83.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "First Button is DropdownMenu Button with expanded DropDownMenu.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass84.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Selected value of DropdownButton is shown in dropdownfield.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass85.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Second Button is IconButton i.e we use Bluetooth Icon.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass86.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Icon Button is Pressed in this Screen.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass87.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Third Button is ElevatedButton",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass88.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Elevated Button is Pressed in this Screen.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass89.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Fourth Button is PopUpMenuButton",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass90.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Popup Menu is Expanded here",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass91.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Selected value of PopupMenu is Shown in a text",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass92.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Fifth Button is TextButton",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass93.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Text Button is Pressed",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass94.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Again Drawer is Opened to navigate to Part 2 Screen.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass95.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Part 2 Screen is Open with Six Input & Selection Implementation",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass96.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "First Input & Selection is CheckBox Which is pressed in this Screen.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass98.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Second Input & Selection is Date & Time Picker.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass99.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Date Picker is Shown",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass10.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Time Picker is Shown",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass11.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );

    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Third Input & Selection is Radio.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass12.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Fourth Input & Selection is Slider i.e we use volume slider.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass13.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Fifth Input & Selection is Switch.",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass14.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );

    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Switch is Pressed On in this Screen",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass15.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "Six Input & Selection is TextField with button",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass16.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
      ),
    );
    slides.add(
      Slide(
        title: "Output",
         styleTitle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 30),
        description:
            "When Button is Pressed it shows 'text is submitted'",
            styleDescription: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 20),
        pathImage: "assets/Ass8/Ass17.PNG",
         heightImage: 340,
        widthImage: 220,
        backgroundColor: Colors.blue[400],
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
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment 8"),
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

              showDotIndicator: false,
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
