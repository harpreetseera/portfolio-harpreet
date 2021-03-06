import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_harpreet/homepage/homepage_bloc.dart';
import 'package:portfolio_harpreet/homepage/homepage_event.dart';
import 'package:portfolio_harpreet/homepage/homepage_state.dart';
import 'package:portfolio_harpreet/theme/theme_bloc.dart';
import 'package:portfolio_harpreet/theme/theme_event.dart';
import 'package:portfolio_harpreet/theme/theme_state.dart';
import 'package:portfolio_harpreet/ui/helper_widgets/curve_painter.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomePageBloc>(context).add(LoadImageEvent());
  }

  @override
  Widget build(BuildContext context) {
    // Firestore.instance
    //     .collection("app_config")
    //     .document("user-detail")
    //     .setData({
    //   'age': 'hss',
    // });

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) => Scaffold(
        // appBar: AppBar(
        //   title: Text("Harpreet's PortFolio"),
        //   actions: <Widget>[
        //     BlocBuilder<ThemeBloc, ThemeState>(
        //       builder: (context, themeState) => IconButton(
        //         icon: Icon(themeState == DarkThemeState()
        //             ? Icons.lightbulb_outline
        //             : Icons.brightness_3),
        //         onPressed: () {
        //           BlocProvider.of<ThemeBloc>(context).add(ThemeEvent.Toggle);
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // String url = await FirebaseStorage.instance
            //     .ref()
            //     .child("happy.jpg")
            //     .getDownloadURL();
            // print('Image Url : $url');
          },
        ),
        body: Container(
          color:
              themeState == LightThemeState() ? Colors.lime[100] : Colors.black,
          child: Container(
            height: double.maxFinite,
            child: Stack(
              children: <Widget>[
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth < 500
                          ? double.maxFinite
                          : MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 2,
                      child: CustomPaint(
                        painter: CurvePainter(
                          upperLayerColor: themeState == LightThemeState()
                              ? Colors.green
                              : Colors.grey,
                          loweLayerColor: themeState == LightThemeState()
                              ? Colors.lime
                              : Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 56,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: IconButton(
                            icon: Icon(themeState == DarkThemeState()
                                ? Icons.lightbulb_outline
                                : Icons.brightness_3),
                            onPressed: () {
                              BlocProvider.of<ThemeBloc>(context)
                                  .add(ThemeEvent.Toggle);
                            },
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: BlocBuilder<HomePageBloc, HomePageState>(
                        builder: (context, homePageState) =>
                            SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Card(
                                  color: themeState == LightThemeState()
                                      ? Colors.white.withOpacity(0.7)
                                      : Colors.grey[800].withOpacity(0.7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: new BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(
                                              fit: BoxFit.cover,
                                              image: new NetworkImage(BlocProvider
                                                          .of<HomePageBloc>(
                                                              context)
                                                      .userImageUrl ??
                                                  "https://www.sentinelassam.com/wp-content/uploads/2019/05/dil.jpg"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      StreamBuilder<DocumentSnapshot>(
                                          stream: Firestore.instance
                                              .collection("app_config")
                                              .document("user-detail")
                                              .snapshots(),
                                          builder: (context, asyncSnapshot) {
                                            return Text(
                                              asyncSnapshot
                                                      .data['greeting_title'] ??
                                                  "Hello",
                                              style: TextStyle(fontSize: 24),
                                            );
                                          }),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: StreamBuilder<DocumentSnapshot>(
                                            stream: Firestore.instance
                                                .collection("app_config")
                                                .document("user-detail")
                                                .snapshots(),
                                            builder: (context, asyncSnapshot) {
                                              return Text(
                                                asyncSnapshot
                                                    .data['description'],
                                                style: TextStyle(fontSize: 16),
                                                textAlign: TextAlign.center,
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: themeState == LightThemeState()
                                    ? Colors.white.withOpacity(0.7)
                                    : Colors.grey[800],
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Text("Project Line UP"),
                              ),
                              Card(
                                color: themeState == LightThemeState()
                                    ? Colors.white.withOpacity(0.7)
                                    : Colors.grey[800],
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: StreamBuilder<QuerySnapshot>(
                                    stream: Firestore.instance
                                        .collection("projects")
                                        .snapshots(),
                                    builder: (context, snapshotDocumentList) {
                                      return snapshotDocumentList.hasData
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: snapshotDocumentList
                                                  .data.documents.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  leading: Icon(Icons
                                                      .airline_seat_flat_angled),
                                                  // Container(
                                                  //   width: 60.0,
                                                  //   // height: 100.0,
                                                  //   decoration: new BoxDecoration(
                                                  //     shape: BoxShape.circle,
                                                  //     image: new DecorationImage(
                                                  //       fit: BoxFit.cover,
                                                  //       image: new NetworkImage(
                                                  //           "https://www.sentinelassam.com/wp-content/uploads/2019/05/dil.jpg"),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  title: Text(snapshotDocumentList.data.documents.elementAt(index).data["project_name"]),
                                                  subtitle:
                                                      Text(snapshotDocumentList.data.documents.elementAt(index).data["project_small_description"]),
                                                  trailing: Icon(
                                                      Icons.arrow_forward_ios),
                                                );
                                              })
                                          : snapshotDocumentList.hasError
                                              ? Text(snapshotDocumentList.error)
                                              : CircularProgressIndicator();
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
