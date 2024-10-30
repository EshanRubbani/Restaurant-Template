import 'package:flutter/material.dart';

class CarasoulsliderDesktop extends StatefulWidget {
  const CarasoulsliderDesktop({Key? key}) : super(key: key);

  @override
  _CarasoulsliderDesktopState createState() => _CarasoulsliderDesktopState();
}

class _CarasoulsliderDesktopState extends State<CarasoulsliderDesktop> {
  // Page controller to control page changes
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of image URLs (replace with actual image paths or network URLs)
  final List<String> images = [
   "",
   "",
   "",
   "",
   "",
   "",
   "",
   "",
   "",
   ""
  ];

  @override
  void initState() {
    super.initState();
    // Start automatic page view change
    Future.delayed(const Duration(seconds: 3), () {
      _startAutoPlay();
    });
  }

  void _startAutoPlay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        int nextPage = _currentPage < images.length - 1 ? _currentPage + 1 : 0;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentPage = nextPage;
        });
      }
      _startAutoPlay();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      color: const Color.fromRGBO(189, 189, 189, 1),
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.grey,
                child: Image.asset(
                  "assets/shop (${index}).png",
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: _currentPage == index ? 12.0 : 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
