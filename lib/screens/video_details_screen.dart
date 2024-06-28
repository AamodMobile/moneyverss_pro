import 'package:fiinzy_pro/constants/all_logs.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/models/TrainingVideloListModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailsScreen extends StatefulWidget {
  final TrainingVideoData videoData;

  const VideoDetailsScreen({super.key, required this.videoData});

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  late YoutubePlayerController controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    /*String videoId = YoutubePlayer.convertUrlToId(widget.videoData.videoLink.toString())??"";*/
    String videoId = YoutubePlayer.convertUrlToId(
            "https://www.youtube.com/watch?v=0NrO29CvhE0") ??
        "";

    void listener() {
      if (_isPlayerReady && mounted && !controller.value.isFullScreen) {
        setState(() {
          _playerState = controller.value.playerState;
          _videoMetaData = controller.metadata;
          isFullScreen = controller.value.isFullScreen;
        });
      }
    }

    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        //SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      },
      onEnterFullScreen: (){
        SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      },
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              Log.console('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          /*controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          _showSnackBar('Next Video Started!');*/
        },
      ),
      builder: (context, player) => SafeArea(
        child: isFullScreen
            ? Column(
                children: [
                  player,
                ],
              )
            : Scaffold(
                backgroundColor: homeBgCl,
                appBar: PreferredSize(
                  preferredSize: Size(MediaQuery.of(context).size.width, 65),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16,),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: whiteColor,
                        border: Border.fromBorderSide(
                            BorderSide(color: Color(0xFFB6D3FF)))),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                              child: Image.asset(
                                icBack,
                                height: 24,
                                width: 24,
                              ),
                            )),
                        Text(
                          "Training Video",
                          style: TextStyle(
                            color: draKText,
                            fontFamily: semiBold,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    SizedBox(
                        height: 10, width: MediaQuery.of(context).size.width),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02,
                          vertical: MediaQuery.of(context).size.height * 0.006),
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01,
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      decoration: BoxDecoration(
                          color: videoDetailsBgItem,
                          border: Border.all(color: dividerCl, width: 1),
                          borderRadius: BorderRadius.circular(7)),
                      child: Column(
                        children: [
                          Visibility(
                            visible : false,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          defaultUser,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Davraj Meena",
                                          style: TextStyle(
                                              color: mainColor,
                                              fontFamily: semiBold,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "Yesterday",
                                          style: TextStyle(
                                              color: mainColor,
                                              fontFamily: regular,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Visibility(
                                  visible: true,
                                  child: Icon(
                                    Icons.more_horiz,
                                    size: 24,
                                    color: dividerCl,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Wrap(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.videoData.title.toString(),
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: textColorSec,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: semiBold,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          player,
                          /*InkWell(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: 240,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.network(
                                ApiUrl.imageUrl+widget.videoData.videoThumbnail.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: 240,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Image.asset(
                                  playIc,
                                  height: 55,
                                  width: 55,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),*/
                          //const SizedBox(height: 24),
                          Visibility(
                            visible: false,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.30,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          heartIc,
                                          height: 16,
                                          width: 16,
                                        ),
                                        const SizedBox(
                                          width: 14,
                                        ),
                                        const Text(
                                          "like 10k",
                                          maxLines: 2,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: mainColor,
                                            fontFamily: regular,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.30,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        messageIc,
                                        height: 16,
                                        width: 16,
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      const Text(
                                        "Com.10k",
                                        maxLines: 2,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: mainColor,
                                          fontFamily: regular,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: true,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          sendIc,
                                          height: 16,
                                          width: 16,
                                        ),
                                        const SizedBox(
                                          width: 14,
                                        ),
                                        const Text(
                                          "Send 200",
                                          maxLines: 2,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: mainColor,
                                            fontFamily: regular,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Description",
                                style: TextStyle(
                                  color: mainColor,
                                  fontFamily: regular,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(6)),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              widget.videoData.longDescription.toString(),
                              style: TextStyle(
                                color: textLightGrey,
                                fontFamily: regular,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
