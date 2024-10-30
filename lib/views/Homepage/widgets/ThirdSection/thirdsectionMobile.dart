import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/GLobals/constants.dart';
import 'package:restro_web/Models/Department/departments/departments.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';

class ThirdsectionMobile extends StatefulWidget {
    final ScrollController scrollController;  // Add this
  const ThirdsectionMobile({Key? key, required this.scrollController}) : super(key: key);

  @override
  State<ThirdsectionMobile> createState() => _ThirdsectionMobileState();
}

class _ThirdsectionMobileState extends State<ThirdsectionMobile> {
  int? _selectedIndex; // Variable to store the selected container index
  bool isloaded = false;
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

 @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchMenu().then((_) {
      setState(() {}); // Rebuild the widget once the data is fetched
      isloaded = true;
      _selectedIndex = 0;
    });
  }

  List<Departments> departments = [];
  Dio dio = Dio(); // Create Dio instance
  // List to store departments from API

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(40, 37, 46, 1),
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              section(context),
              secondsection(context),
              SizedBox(
                height: 30,
              ),
              buildGrid(context),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container secondsection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Container(
        height: 100, // Adjust height based on your design
        margin: EdgeInsets.all(16), // Add some outer margin
        child: isloaded
            ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                            InkWell(onTap: _scrollLeft,child: Icon(Icons.arrow_left,color: Colors.grey,size: 36,)),

                Expanded(
                  child: GridView.builder(
                          controller: _scrollController,

                      scrollDirection: Axis.horizontal, // Horizontal scroll
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // One row
                        mainAxisSpacing: 16, // Space between items
                        childAspectRatio:
                            0.5, // Controls the width-to-height ratio of the items
                      ),
                      itemCount:
                          departments.isNotEmpty && departments[0].department != null
                              ? departments[0]
                                  .department!
                                  .length // Number of categories to display
                              : 0,
                      itemBuilder: (context, index) {
                        // Get department data
                        var department = departments[0].department![index];
                  
                        // Check if this container is selected
                        bool isSelected = _selectedIndex == index;
                  
                        return GestureDetector(
                          onTap: () {
                            // Set the selected index when a container is clicked
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(
                                milliseconds: 300), // Smooth animation when resizing
                            padding: EdgeInsets.all(
                                16), // Adjust padding to match the image
                            width:
                                isSelected ? 120 : 100, // Increase size if selected
                            height:
                                isSelected ? 120 : 100, // Increase size if selected
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.amber.shade400 // Change color if selected
                                  : Color.fromRGBO(55, 52, 62, 1),
                              border: Border.all(
                                color: Colors.black,
                                width: 1, // Border color and width
                              ),
                              borderRadius:
                                  BorderRadius.circular(12), // Rounded corners
                            ),
                            child: Center(
                              child: Text(
                                // Display both department name and department ID
                                '${department.departmentName} ',
                                style: TextStyle(
                                  fontSize:12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.literata().fontFamily,
                                  color: isSelected
                                      ? Colors.white // Change text color if selected
                                      : Color.fromRGBO(255, 244, 226, 1),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ),
              InkWell(onTap: _scrollRight,child: Icon(Icons.arrow_right,color: Colors.grey,size: 36,))
                
              ],
            )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.grey.shade800,
                ),
              ),
      ),
    );
  }

  Container section(BuildContext context) {
    return Container(
      height: 161,
      child: Column(
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
                "MENUS",
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
            "Discover Our Menus",
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
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              "Explore a Culinary Journey Through the Mediterranean.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(144, 163, 177, 1)),
            ),
          )
        ],
      ),
    );
  }

  buildGrid(BuildContext context) {
    // Get selected department if any
    var selectedDepartment = _selectedIndex != null
        ? departments[0].department![_selectedIndex!]
        : null;

    // Get items for the selected department, or use an empty list if no department is selected
    var items = selectedDepartment?.item ?? [];

    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
      height: MediaQuery.of(context).size.height * 1.1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate crossAxisCount dynamically based on screen width
          int crossAxisCount = constraints.maxWidth < 500 ? 1 : 2;

         return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                // If we reach the bottom of the grid
                print("Reached bottom of the grid.");
                if (widget.scrollController.hasClients) {
                  // Scroll the parent page downwards by 200 pixels (customize as needed)
                  widget.scrollController.animateTo(
                    widget.scrollController.position.pixels + 200,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              } else if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.minScrollExtent) {
                // If we reach the top of the grid
                print("Reached top of the grid.");
                if (widget.scrollController.hasClients) {
                  // Scroll the parent page upwards by 200 pixels
                  widget.scrollController.animateTo(
                    widget.scrollController.position.pixels - 200,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              }
              return true; // Continue listening to scroll notifications
            },
            child: isloaded
                ? GridView.builder(
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 30.0,
                      mainAxisExtent: 200, // Keeps item height rigid
                    ),
                    itemBuilder: (context, index) {
                      var item = items[index];
                      return Container(
                        child: Stack(
                          children: [
                            FutureBuilder<String>(
                              future: fetchImageFromApi(item.id!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError ||
                                    !snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return Center(child: Text('No image found'));
                                } else {
                                  try {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Adjust this value to control the roundness
                                      child: Image.memory(
                                        base64Decode(snapshot.data!),
                                        width: 170,
                                        height: 170,
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } catch (e) {
                                    return Center(
                                        child: Text('Error decoding image'));
                                  }
                                }
                              },
                            ),
                            Positioned(
                              left: constraints.maxWidth * 0.35,
                              right: 0,
                              top: 0,
                              bottom: 30,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 24, right: 24, top: 12,),
                                padding: const EdgeInsets.all(16.0),
                                color: Color.fromRGBO(55, 52, 62, 1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text(
                                            '${item.name}',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize:
                                                  AppStyles.getDynamicFontSize(
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width* 0.8),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: GoogleFonts.literata()
                                                  .fontFamily,
                                              color: Color.fromRGBO(
                                                  255, 244, 226, 1),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '\$${item.price}',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize:
                                                AppStyles.getDynamicFontSize(
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width * 0.9),
                                            fontWeight: FontWeight.w600,
                                            fontFamily:
                                                GoogleFonts.inter().fontFamily,
                                            color:
                                                Color.fromRGBO(228, 198, 32, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${item.itemDescription}',
                                      style: TextStyle(
                                        fontSize: AppStyles.getDynamicFontSize(
                                            MediaQuery.of(context).size.width *
                                                0.7),
                                        fontWeight: FontWeight.w400,
                                        fontFamily:
                                            GoogleFonts.inter().fontFamily,
                                        color: Color.fromRGBO(144, 163, 177, 1),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.amber,
                                          child: Icon(
                                            Icons.add_shopping_cart_rounded,
                                            color: Colors.black,
                                            size: MediaQuery.of(context).size.height* 0.025,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  ),
          );
        },
      ),
    );
  }

  Future<void> fetchMenu() async {
    const String token = ApiConstants.token;
    var url = ApiConstants.getMenu;

    try {
      // Make the GET request with Dio
      var response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      // Debugging: Print the response
      if (response.statusCode == 200) {
        // Decode the JSON response
        var jsonResponse = jsonDecode(response.data);

        // Check if "Department" key exists and is a list
        if (jsonResponse['Department'] is List) {
        // Iterate through the departments and filter out the ones you don't want
        List<dynamic> departmentList = jsonResponse['Department']
            .where((department) =>
                department['DepartmentName'] != 'COUPONS' &&
                department['DepartmentId'] != 'COUPONS' &&  department['DepartmentId'] != 'NO' &&  department['DepartmentId'] != 'NONE' &&  department['DepartmentId'] != 'ModGroup')
            .toList();

        // Convert the filtered list to the Departments model
        if (departmentList.isNotEmpty) {
          jsonResponse['Department'] = departmentList;
          Departments departmentData = Departments.fromMap(jsonResponse);

          // Add to departments list if not empty
          departments.add(departmentData);
        }

        // Debugging: Print the list of departments
        print('Departments: ${departments.length}');
        } else {
          print('Error: Department data is not a list.');
        }
      } else {
        print('Error: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Container buildServices(BuildContext context) {
    return Container(
      // height: 1237,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "pngs/background3.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.6),
            padding: EdgeInsets.only(top: 40, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
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
                      "SERVICES",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 14,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(228, 198, 32, 1)),
                    ),
                  ],
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 950) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Catering Services",
                            style: TextStyle(
                                fontFamily: GoogleFonts.literata().fontFamily,
                                fontSize: 48,
                                letterSpacing: -2,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 244, 226, 1)),
                          ),
                          SizedBox(
                            width: 32,
                          ),
                          Container(
                            width: 270,
                            child: Text(
                              "Sed nulla sed purus vitasse. urna est iverra sed etiam quisque. Nisl in pulvinar ultrices",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 244, 226, 1)),
                            ),
                          ),
                          SizedBox(
                            width: 32,
                          ),
                          Container(
                            height: 48,
                            width: 170,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                side: BorderSide(
                                  color: Color.fromRGBO(255, 244, 226, 1),
                                ),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Learn More',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color.fromRGBO(255, 244, 226, 1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color.fromRGBO(255, 244, 226, 1),
                                    size: 14,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Catering Services",
                            style: TextStyle(
                                fontFamily: GoogleFonts.literata().fontFamily,
                                fontSize: 22,
                                letterSpacing: -2,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 244, 226, 1)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: 270,
                            child: Text(
                              "Sed nulla sed purus vitasse. urna est iverra sed etiam quisque. Nisl in pulvinar ultrices",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 244, 226, 1)),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 48,
                            width: 170,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                side: BorderSide(
                                  color: Color.fromRGBO(255, 244, 226, 1),
                                ),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Learn More',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color.fromRGBO(255, 244, 226, 1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color.fromRGBO(255, 244, 226, 1),
                                    size: 14,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 860,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildSection(
                        title: 'Corporate',
                        description:
                            'Mauris dis tincidunt ipsum faucibus ipsum laoret vivamus ultrices dolor vel nisl ultrices enim vel feugiat lectus nisi phasellus egestas',
                        isImageLeft: true,
                        onPressed: () {
                          // Handle book now for Corporate
                        },
                      ),
                      SizedBox(height: 50),
                      buildSection(
                        title: 'Birthday Party',
                        description:
                            'Mauris dis tincidunt ipsum faucibus ipsum laoret vivamus ultrices dolor vel nisl ultrices enim vel feugiat lectus nisi phasellus egestas',
                        isImageLeft: false,
                        onPressed: () {
                          // Handle book now for Birthday Party
                        },
                      ),
                      SizedBox(height: 50),
                      buildSection(
                        title: 'Housewarmings',
                        description:
                            'Mauris dis tincidunt ipsum faucibus ipsum laoret vivamus ultrices dolor vel nisl ultrices enim vel feugiat lectus nisi phasellus egestas',
                        isImageLeft: true,
                        onPressed: () {
                          // Handle book now for Housewarmings
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSection({
    required String title,
    required String description,
    required bool isImageLeft,
    required VoidCallback onPressed,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Getting screen width for responsiveness
        final screenWidth = MediaQuery.of(context).size.width;
        final containerHeight = 253.0; // Adjust height for smaller screens
        final imageWidth = 500; // Adjust image width for smaller screens
        final textWidth = 412; // Adjust text container width

        return Container(
          width: screenWidth, // Use full screen width for responsiveness
          height: containerHeight, // Set height dynamically
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isImageLeft)
                Container(
                  width: MediaQuery.of(context).size.width * 0.32,
                  // width: imageWidth,
                  height: containerHeight,
                  color: Color.fromRGBO(189, 189, 189, 1),
                ),
              Container(
                width: textWidth * 0.6,
                height: containerHeight,
                padding: isImageLeft
                    ? EdgeInsets.only(left: 20.0)
                    : EdgeInsets.only(left: 20.0),
                color: Color.fromRGBO(40, 37, 46, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: GoogleFonts.literata().fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize:
                            screenWidth > 600 ? 28 : 22, // Adjust font size
                        color: Color.fromRGBO(255, 244, 226, 1),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width:
                          textWidth * 0.85, // Responsive text container width
                      child: Text(
                        description,
                        style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize:
                              screenWidth > 600 ? 16 : 14, // Adjust font size
                          color: Color.fromRGBO(144, 163, 177, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: screenWidth > 600
                          ? 43
                          : 36, // Responsive button height
                      child: ElevatedButton(
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Book Now',
                              style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: screenWidth > 600
                                    ? 16
                                    : 14, // Adjust font size
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: screenWidth > 600
                                  ? 14
                                  : 12, // Adjust icon size
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (!isImageLeft)
                Container(
                  width: MediaQuery.of(context).size.width * 0.32,
                  height: containerHeight,
                  color: Color.fromRGBO(189, 189, 189, 1),
                ),
            ],
          ),
        );
      },
    );
  }

// Fetch image from API using Dio and return only the Base64 image data
  Future<String> fetchImageFromApi(String itemNumber) async {
    const String token = ApiConstants.token;
    String url = "${ApiConstants.GetImageByItemNumber}$itemNumber";

    try {
      // Send a GET request using Dio
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      // Check if response.data is a string and decode it if necessary
      dynamic responseData = response.data;
      if (responseData is String) {
        // Decode the JSON string into a Map
        responseData = json.decode(responseData);
      }

      // Ensure the response contains the Base64String key and clean it
      if (responseData.containsKey('Base64String') &&
          responseData['Base64String'].isNotEmpty) {
        // Remove the 'data:image/jpg;base64,' prefix and return only the image data
        final base64Image = responseData['Base64String']
            .replaceFirst('data:image/jpg;base64,', '');
        return base64Image;
      } else {
        throw Exception('No Base64 string found in response');
      }
    } catch (e) {
      print('Error fetching image: $e');
      return ""; // Return an empty string on error
    }
  }
}
