import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
//imports for downloading
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:isolate';
import 'dart:ui';

class TextAudioPlayer extends StatefulWidget {
  final String? audioPath;
  final String? txtContents;
  const TextAudioPlayer({Key? key, this.audioPath, this.txtContents})
      : super(key: key);

  @override
  _TextAudioPlayerState createState() => _TextAudioPlayerState();
}

class _TextAudioPlayerState extends State<TextAudioPlayer> {
  Duration _duration = Duration();
  Duration _position = Duration();

  // add it to your class as a static member
  // static AudioCache player = AudioCache();

  //Downloading audio
  int progress = 0;
  var taskId;
  ReceivePort _receivePort = ReceivePort();

  static downloadingCallBack(id, status, progress) {
    //looking up for a send port
    SendPort? sendPort = IsolateNameServer.lookupPortByName('downloading');
    //sending the data
    sendPort!.send([id, status, progress]);
  }
  //downloading logi ends

  // or as a local variable
  // final player = AudioCache(prefix: 'assets/');

  //new video code florian prum channel
  AudioPlayer audioPlayer = AudioPlayer();

  AudioCache? audioCache;

  // String path = 'sound_audio.mp3';
  //new audio
  // String path = 'COVID_19.mp3';

  //path taken from the local object [topic]
  // String? path = widget.audioPath;
  // 'https://hwcdn.libsyn.com/p/7/1/6/716785ae39065fbd/Audio_Twitter_Tweets.mp3?c_id=1940985&cs_id=1940985&expiration=1633186006&hwt=4823bc719649d5553836deb6a6815cbe';
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
  void initState() {
    super.initState();
    //for downloading
    //register a send port for the other isolates
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, 'downloading');

    //listening for data thats comming from other isolates
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });
      print('This is the progress value: $progress');
    });
    FlutterDownloader.registerCallback(downloadingCallBack);

    //downloading ends

    //new code from florian prumer channel
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onDurationChanged.listen((s) {
      setState(() {
        _duration = s;
      });
    });

    // this.widget.advancedPlayer!.onAudioPositionChanged.listen((p) {
    //   setState(() {
    //     _position = p;
    //   });
    // });

    //new code
    audioPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    // this.widget.advancedPlayer!.setUrl(path);
    // audioPlayer.setUrl(path, isLocal: true);
    audioPlayer.setUrl(widget.audioPath!, isLocal: true);
    // audioCache!.load(path);
    audioCache!.load(widget.audioPath!);

    // this.widget.advancedPlayer!.onPlayerCompletion.listen((event) {
    //   setState(() {
    //     _position = Duration(seconds: 0);
    //     if (isRepeat == true) {
    //       isPlaying = true;
    //     } else {
    //       isPlaying = false;
    //       isRepeat = false;
    //     }
    //   });
    // });

    //new code
    audioPlayer.onPlayerCompletion.listen((event) {
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

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    // audioCache!.clear(Uri.parse(path));
    audioCache!.clear(Uri.parse(widget.audioPath!));
  }

  // Widget btnStart() {
  //   //isPlaying = bool;
  //   return IconButton(
  //       // alignment: Alignment.center,
  //       // padding: EdgeInsets.only(left: 10, right: 30),
  //       onPressed: () {
  //         if (isPlaying == false) {
  //           // this.widget.advancedPlayer!.play(path);
  //           // audioPlayer.play(path);
  //           // audioCache!.play(path);
  //           audioCache!.play(widget.audioPath!);
  //           setState(() {
  //             isPlaying = true;
  //           });
  //         } else if (isPlaying == true) {
  //           // this.widget.advancedPlayer!.pause();
  //           audioPlayer.pause();

  //           setState(() {
  //             isPlaying = false;
  //           });
  //         }
  //         // if (isPlaying == false) {
  //         //   // this.widget.advancedPlayer!.play(path);
  //         //   // audioPlayer.play(path);
  //         //   audioCache!.play(path);

  //         //   setState(() {
  //         //     isPaused = false;
  //         //     _pauseColor = Colors.black;
  //         //     _playingColor = Color(0xff35016D);
  //         //     isStopped = false;
  //         //   });
  //         // }
  //       },
  //       icon: Icon(
  //         isPlaying == true ? _icons[1] : _icons[0],
  //         // Icons.play_circle_fill,
  //         // color: _playingColor,
  //         color: Color(0xff35096D),
  //         size: 50,
  //         // color: Color(0xff35096D),
  //       ));
  // }

  //new btnStart button
  Widget btnStart() {
    return IconButton(
        onPressed: () {
          if (isPlaying == false) {
            audioCache!.play(widget.audioPath!);
            setState(() {
              isPlaying = true;
            });
          } else if (isPlaying == true) {
            audioPlayer.pause();

            setState(() {
              isPlaying = false;
            });
          }
        },
        icon: Icon(
          isPlaying == true ? _icons[1] : _icons[0],
          // Icons.play_circle_fill,
          // color: _playingColor,
          color: Color(0xff35096D),
          size: 35,
          // color: Color(0xff35096D),
        ));
  }

  Widget loadAsset() {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        btnDownload(),
        // btnPause(),
        btnPrevious(),
        // btnStart(),
        btnStart(),
        btnNext(),
        // btnStop(),
        btnShare(),
      ],
    );
  }

  Widget get slider {
    return Slider(
      activeColor: Color(0xff35016D),
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
  //new wave progress bar
  // Widget waveProgressBar() {
  //   return waveProgressBar();
  // }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    // this.widget.advancedPlayer!.seek(newDuration);
    audioPlayer.seek(newDuration);
  }

  Widget btnStop() {
    return IconButton(
      icon: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.042,
        width: MediaQuery.of(context).size.width * 0.06,
        decoration: BoxDecoration(
          // color: Color(0xff4B4445),
          color: isStopped == false ? Color(0xff4B4445) : Color(0xff35016D),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.stop,
          color: Colors.white,
          size: 16,
        ),
      ),
      onPressed: () {
        // this.widget.advancedPlayer!.stop();
        //new code
        audioPlayer.stop();

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
          // this.widget.advancedPlayer!.pause();
          //new code
          audioPlayer.pause();
          setState(() {
            isPaused = true;
            isStopped = false;
            _pauseColor = Color(0xff35016D);
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
        size: 30,
      ),
    );
  }

  Widget btnDownload() {
    return IconButton(
      onPressed: () async {
        final status = await Permission.storage.request();

        if (status.isGranted) {
          final externalDir = await getExternalStorageDirectory();

          taskId = await FlutterDownloader.enqueue(
            // url: "${widget.audioPath}",
            url: 'https://nature.berkeley.edu/ucce50/ag-labor/english/000c.zip',
            savedDir: externalDir!.path,
            fileName: 'audio $taskId',
            showNotification: true,
            openFileFromNotification: true,
            saveInPublicStorage: true,
          );
          print('audio url ===== $taskId');
        } else {
          print('Permission denied!');
        }
      },
      icon: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
          color: Color(0xff35096D),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.download,
          color: Colors.white,
          size: 20,
        ),
      ),
      iconSize: 40,
    );
  }

  //widget for next button
  Widget btnPrevious() {
    return IconButton(
      onPressed: () {
        setState(() {
          if (_position <= _duration) {
            _position += Duration(seconds: -10);
            final result = _position;
            changeToSecond(result.inSeconds);
          }
        });
        // int result = await audioPlayer.seek(Duration(milliseconds: 1200));
      },
      icon: Image.asset(
        'assets/previous.png',
        // excludeFromSemantics: true,
        matchTextDirection: true,
      ),
      iconSize: 10,
    );
  }

  Widget btnNext() {
    return IconButton(
      onPressed: () {
        setState(() {
          _position += Duration(seconds: 10);
          final result = _position;
          changeToSecond(result.inSeconds);
        });
      },
      icon: Image.asset(
        'assets/next.png',
        matchTextDirection: true,
        // fit: BoxFit.fitHeight,
      ),
      // iconSize: 20,
    );
  }

  Widget btnShare() {
    return IconButton(
      onPressed: () async {
        // if (path.isEmpty) {
        if (widget.audioPath!.isEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('No Audio provided!')));
        } else {
          // Share.share('this is');
          // Share.shareFiles(['assets/audioButoon.png'], text: 'Great picture');
          // Share.share('check out my audio $path');
          //this is the second latest
          // Share.share('Check out this ${widget.audioPath!}');
          //this is latest
          Share.share('Check out this ${widget.txtContents!}');
        }

        // Share.shareFiles(path, text: 'Great picture');
      },
      icon: Image.asset('assets/share.png'),
      iconSize: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.black,
            //   ),
            // ),
            // width: screenWidth * 0.8,
            height: screenHeight * 0.16,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.04,
                    right: screenWidth * 0.047,
                  ),
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
                slider,
                // loadAsset(),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          // top: MediaQuery.of(context).size.height * 0.07,
          top: screenHeight * 0.095,
          // width: screenWidth * 0.8,

          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: loadAsset(),
        )
      ],
    );
  }
}
