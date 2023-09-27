import 'package:flutter/material.dart';
import 'package:travel_app_design/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _locations = [
    'Poluare',
    'Japan',
    'Moscow',
    'London'
  ];
  int _activeLocation = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        bottom: true,
        minimum: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.05,
          0,
          MediaQuery.of(context).size.width * 0.05,
          0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _topBar(),
            _locationBar(context),
            _articlesList(context),
          ],
        ),
      ),
    );
  }

  Widget _locationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.03,
        bottom: MediaQuery.of(context).size.height * 0.03,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.065,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(69, 69, 69, 1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _locations.map((loc) {
            bool isActive = _locations[_activeLocation] == loc ? true : false;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  loc,
                  style: TextStyle(
                    fontSize: 15,
                    color: isActive ? Colors.white : Colors.white54,
                    fontFamily: 'Montserrat',
                  ),
                ),
                isActive
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.redAccent,
                        ),
                        height: 5,
                        width: 30,
                      )
                    : Container(),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.menu,
          color: Colors.black87,
          size: 35,
        ),
        Container(
          height: 39,
          width: 144,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/logo_discover.png"),
            ),
          ),
        ),
        const Icon(
          Icons.search,
          color: Colors.black87,
          size: 35,
        ),
      ],
    );
  }

  Widget _articlesList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (ctx, index) {
          Widget _articleInfoColumn() {
            Widget _authorinfoRow() {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage('https://i.pravatar.cc/300'),
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                articles[index].author,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Text(
                                '3 Hours Ago',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.bookmark,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }

            Widget _detailInfoRow() {
              Widget _ratingWidget() {
                return Row(
                  children: List<Widget>.generate(5, (starIndex) {
                    double fillAmount = articles[index].rating - starIndex;
                    Icon starIcon;
                    if (fillAmount >= 1) {
                      starIcon = Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      );
                    } else if (fillAmount >= 0.5) {
                      starIcon = Icon(
                        Icons.star_half,
                        color: Colors.amber,
                        size: 15,
                      );
                    } else {
                      starIcon = Icon(
                        Icons.star_border,
                        color: Colors.amber,
                        size: 15,
                      );
                    }
                    return starIcon;
                  }),
                );
              }

              return Padding(
                padding: EdgeInsets.fromLTRB(
                  30,
                  MediaQuery.of(context).size.height * 0.05,
                  30,
                  0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      shape: CircleBorder(),
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.redAccent,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              articles[index].title,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 3,
                              bottom: 3,
                            ),
                            child: Text(
                              articles[index].location,
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          _ratingWidget()
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.05,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.33,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(articles[index].image),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _authorinfoRow(),
                      _detailInfoRow(),
                    ],
                  ),
                ),
              ),
            );
          }

          Widget _socialInfoContainer() {
            return Positioned(
              bottom: 30,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: Colors.redAccent,
                        ),
                        Text(
                          articles[index].likes.toString(),
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.mode_comment,
                          color: Colors.grey,
                        ),
                        Text(
                          articles[index].comments.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.grey,
                        ),
                        Text(
                          articles[index].shares.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }

          return Stack(
            clipBehavior: Clip.none,
            children: [
              _articleInfoColumn(),
              _socialInfoContainer(),
            ],
          );
        },
      ),
    );
  }
}
