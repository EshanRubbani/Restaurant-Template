import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutfourthMobile extends StatelessWidget {
const AboutfourthMobile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    ScrollController _scrollController = ScrollController();


  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 100, // Adjust scroll offset for left
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 100, // Adjust scroll offset for right
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

       return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: FractionalOffset.centerLeft,end: FractionalOffset.centerRight,colors: [Color.fromRGBO(55, 52, 62, 1),Color.fromRGBO(114, 113, 117,1)])
        ),
      // height: 765,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset("pngs/background4.png",)),
          Container(
            // padding: EdgeInsets.all(150),
            padding: EdgeInsets.only(top: 40, bottom: 40),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      color: Color.fromRGBO(228, 198, 32, 1),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "TESTIMONIALS",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 14,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(228, 198, 32, 1)),
                    ),
                  ],
                ),
                Text(
                  "What People Says",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: GoogleFonts.literata().fontFamily,
                      fontSize: 22,
                      letterSpacing: -2,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(255, 244, 226, 1)),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    "Hear from Our Satisfied Guests.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(144, 163, 177, 1)),
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
  width: MediaQuery.of(context).size.width * 0.95,
  height: 350, // Limit height to one testimonial height
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
                                                  InkWell(onTap: _scrollLeft,child: Icon(Icons.arrow_left,color: Colors.grey,size: 36,)),

      Expanded(
        child: ListView.builder(
                                controller: _scrollController,
        
          scrollDirection: Axis.horizontal,
          itemCount: 4, // Number of testimonials
          itemBuilder: (context, index) {
            // Define your data for each testimonial
            final testimonials = [
              {
                "title": "Love the menus",
                "description":
                    "This is a hidden gem in Toledo! The food is absolutely delicious and authentic. From the flavorful hummus to the perfectly grilled kebabs, every dish is a masterpiece.",
                "name": "Julia William",
                "position": "Manager at Furniti",
              },
              {
                "title": "Amazing experience",
                "description":
                    "I've been searching for a good Mediterranean restaurant in Toledo, and LaVie has exceeded my expectations. The service is impeccable, and the staff is incredibly friendly.",
                "name": "John Doe",
                "position": "CEO at ComfortSpace",
              },
              {
                "title": "Great Service",
                "description":
                    "This is a hidden gem in Toledo! The food is absolutely delicious and authentic. From the flavorful hummus to the perfectly grilled kebabs, every dish is a masterpiece.",
                "name": "Emily Johnson",
                "position": "Designer at ArtSpace",
              },
              {
                "title": "Loved the ambiance",
                "description":
                    "I've been searching for a good Mediterranean restaurant in Toledo, and LaVie has exceeded my expectations. The service is impeccable, and the staff is incredibly friendly.",
                "name": "Michael Smith",
                "position": "Chef at GourmetHouse",
              },
            ];
        
            return Container(
              padding: EdgeInsets.only(right: 30),
              child: buildTestimonial(
                testimonials[index]['title']!,
                testimonials[index]['description']!,
                testimonials[index]['name']!,
                testimonials[index]['position']!,
                context,
              ),
            );
          },
        ),
      ),
                                                  InkWell(onTap: _scrollRight,child: Icon(Icons.arrow_right,color: Colors.grey,size: 36,)),

    ],
  ),
),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


  // Builder for testimonial widget
  Widget buildTestimonial(String title, String description, String name,
      String position, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 350,
      color: Color.fromRGBO(255, 244, 226, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 22,
            child: Image.asset("pngs/comma.png")
          ),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(187, 58, 18, 1),
              fontFamily: GoogleFonts.literata().fontFamily,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16),
          Container(
         
            height: 72,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(40, 37, 46, 1),
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10),
          buildProfileInfo(name, position),
        ],
      ),
    );
  }

  // Builder for profile section within the testimonial
  Widget buildProfileInfo(String name, String position) {
     String img = position == "Manager at Furniti"
        ? "assets/julia.jpg"
        : position == "CEO at ComfortSpace"
            ? "assets/john.jpg"
            : position == "Designer at ArtSpace"
                ? "assets/emily.jpg"
                : "assets/michael.jpg";
    return Container(
      width: 491,
      height: 102,
      child: Column(
        children: [
           Container(
            width: 60,
            height: 60,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(189, 189, 189, 1),
              child: ClipOval(
                // Ensures the image is clipped to a circle shape
                child: Image.asset(
                  img, // No need to include quotes around variable
                  fit: BoxFit
                      .cover, // Ensures the image covers the entire CircleAvatar
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(40, 37, 46, 1),
              fontFamily: GoogleFonts.inter().fontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
         
        ],
      ),
    );
  }
