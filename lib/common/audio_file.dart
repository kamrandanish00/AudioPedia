import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer? advancedPlayer;
  const AudioFile({Key? key, this.advancedPlayer}) : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = Duration();
  Duration _position = Duration();
  // add it to your class as a static member
  static AudioCache player = AudioCache();

  // or as a local variable
  // final player = AudioCache(prefix: 'assets/');

  final String path =
      'https://hwcdn.libsyn.com/p/7/1/6/716785ae39065fbd/Audio_Twitter_Tweets.mp3?c_id=1940985&cs_id=1940985&expiration=1633186006&hwt=4823bc719649d5553836deb6a6815cbe';
  // 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  bool isStopped = false;
  Color? _pauseColor;
  Color? _playingColor;
  Color? _stoppedColor;
  List<IconData> _icons = [
    Icons.play_circle_filled,
    Icons.pause_circle_filled,
    Icons.stop_circle_rounded,
    Icons.download_for_offline_outlined,
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    this.widget.advancedPlayer!.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    //for audio cache class

    this.widget.advancedPlayer!.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    this.widget.advancedPlayer!.setUrl(path);

    this.widget.advancedPlayer!.onPlayerCompletion.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if (isRepeat == true) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });
  }

  Widget btnStart() {
    //isPlaying = bool;
    return IconButton(
        onPressed: () {
          // if (isPlaying == false) {
          //   this.widget.advancedPlayer!.play(path);
          //   setState(() {
          //     isPlaying = true;
          //   });
          // } else if (isPlaying == true) {
          //   this.widget.advancedPlayer!.pause();
          //   setState(() {
          //     isPlaying = false;
          //   });
          // }
          if (isPlaying == false) {
            this.widget.advancedPlayer!.play(path);
            // player.play(path);
            setState(() {
              isPaused = false;
              _pauseColor = Colors.black;
              _playingColor = Colors.blue;
              isStopped = false;
            });
          }
        },
        icon: Icon(
          _icons[0],
          color: _playingColor,
          // color: _color,
        ));
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          btnPause(),
          btnStart(),
          btnStop(),
          btnDownload(),
        ],
      ),
    );
  }

  Widget slider() {
    return Slider(
      activeColor: Colors.blue,
      inactiveColor: Colors.grey,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          changeToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedPlayer!.seek(newDuration);
  }

  Widget btnStop() {
    return IconButton(
      icon: Container(
        alignment: Alignment.center,
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          // color: Color(0xff4B4445),
          color: isStopped == false ? Color(0xff4B4445) : Colors.blue,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.stop,
          color: Colors.white,
          size: 16,
        ),
      ),
      onPressed: () {
        this.widget.advancedPlayer!.stop();

        setState(() {
          _playingColor = Colors.black;
          _pauseColor = Colors.black;
          isPlaying = false;
          isPaused = false;
          isStopped = true;

          // _duration = Duration(seconds: 0);//i think this is the total duration
          _position = Duration(
              seconds:
                  0); //audio current duration and slider ball position will be reset to initial i-e 0.
        });
      },
    );
  }

  Widget btnPause() {
    return IconButton(
      onPressed: () {
        if (isPaused == false) {
          this.widget.advancedPlayer!.pause();
          setState(() {
            isPaused = true;
            isStopped = false;
            _pauseColor = Colors.blue;
            _playingColor = Colors.black;
          });
        }
        // } else if (isPaused == true) {
        //   this.widget.advancedPlayer!.resume();
        //   _pauseColor = Colors.black;
        //   isPaused = false;
        // }
      },
      icon: Icon(
        _icons[1],
        color: _pauseColor,
      ),
    );
  }

  Widget btnDownload() {
    return IconButton(
      onPressed: () {
        if (isRepeat == false) {
          this.widget.advancedPlayer!.setReleaseMode(ReleaseMode.LOOP);
          setState(() {
            isRepeat = true;
            // _color = Colors.blue;
          });
        } else if (isRepeat == true) {
          this.widget.advancedPlayer!.setReleaseMode(ReleaseMode.RELEASE);
          // _color = Colors.black;
          isRepeat = false;
        }
      },
      icon: Container(
        alignment: Alignment.center,
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: Color(0xff4B4445),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.download,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_position.toString().split('.')[0],
                        style: TextStyle(fontSize: 16)),
                    Text(_duration.toString().split('.')[0],
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              slider(),
              // loadAsset(),
            ],
          ),
        ),
        Positioned(
          top: 40,
          left: 50,
          child: loadAsset(),
        )
      ],
    );
  }
}
