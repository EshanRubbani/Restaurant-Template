import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/GLobals/constants.dart';
import 'package:restro_web/Models/Department/departments/departments.dart';

class ThirdsectionDesktop extends StatefulWidget {
  ThirdsectionDesktop({Key? key}) : super(key: key);

  @override
  State<ThirdsectionDesktop> createState() => _ThirdsectionDesktopState();
}

class _ThirdsectionDesktopState extends State<ThirdsectionDesktop> {
  int? _selectedIndex; // Variable to store the selected container index
  bool isloaded = false;
  String base64Image = "";
  bool isLoading = true;
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
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(40, 37, 46, 1),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width *
              0.05, // 10% of screen width for left and right margin
          vertical: MediaQuery.of(context).size.height *
              0.05, // 5% of screen height for top and bottom margin
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
                        fontSize: 52,
                        letterSpacing: -2,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(255, 244, 226, 1)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Explore a Culinary Journey Through the Mediterranean.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(144, 163, 177, 1)),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 150, right: 150),
              width: MediaQuery.of(context).size.width,
              height:  100,
              child: Container(
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
                              itemCount: departments.isNotEmpty &&
                                      departments[0].department != null
                                  ? departments[0]
                                      .department!
                                      .length // Number of categories to display
                                  : 0,
                              itemBuilder: (context, index) {
                                // Get department data
                                var department = departments[0].department![index];
                          
                                // Check if this container is selected
                                bool isSelected = _selectedIndex == index;
                          
                                if (department.departmentId != "COUPONS") {
                                  return GestureDetector(
                                    onTap: () {
                                      // Set the selected index when a container is clicked
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(
                                          milliseconds:
                                              300), // Smooth animation when resizing
                                    // Adjust padding to match the image
                                      width: isSelected
                                          ? 120
                                          : 100, // Increase size if selected
                                      height: isSelected
                                          ? 50
                                          : 60, // Increase size if selected
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.amber
                                                .shade400 // Change color if selected
                                            : Color.fromRGBO(55, 52, 62, 1),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1, // Border color and width
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            12), // Rounded corners
                                      ),
                                      child: Center(
                                        child: Text(
                                          // Display both department name and department ID
                                          '${department.departmentName} ',
                                          style: TextStyle(
                                            fontSize: AppStyles.getDynamicFontSize(
                                                MediaQuery.of(context).size.width *
                                                    0.85),
                                            fontWeight: FontWeight.w500,
                                            fontFamily:
                                                GoogleFonts.literata().fontFamily,
                                            color: isSelected
                                                ? Colors
                                                    .white // Change text color if selected
                                                : Color.fromRGBO(255, 244, 226, 1),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                }
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
            ),
            SizedBox(
              height: 60,
            ),
            buildGrid(context),
            SizedBox(
              height: 60,
            ),
            // Container(
            //   height: 43,
            //   child: Center(
            //     child: ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.amber,
            //         elevation: 0,
            //       ),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Text(
            //             'View All Menus',
            //             style: TextStyle(
            //               fontFamily: GoogleFonts.inter().fontFamily,
            //               fontWeight: FontWeight.w700,
            //               fontSize: 16,
            //               color: Colors.black,
            //             ),
            //           ),
            //           const SizedBox(
            //             width: 8,
            //           ),
            //           const Icon(
            //             Icons.arrow_forward_ios,
            //             color: Colors.black,
            //             size: 14,
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  buildGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate crossAxisCount dynamically based on screen width
        int crossAxisCount = constraints.maxWidth < 500 ? 1 : 2;

        // Get selected department if any
        var selectedDepartment = _selectedIndex != null
            ? departments[0].department![_selectedIndex!]
            : null;

        // Get items for the selected department, or use an empty list if no department is selected
        var items = selectedDepartment?.item ?? [];

        return Container(
          height: 660,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 150, right: 150),
          child: isloaded
              ? GridView.builder(
                  itemCount: items.length, // Number of items to display
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 30.0,
                    mainAxisSpacing: 30.0,
                    mainAxisExtent: 200, // Keeps item height rigid
                  ),
                  itemBuilder: (context, index) {
                    // Get item data from the selected department
                    var item = items[index];

                    return _buildItemContainer(
                        item, constraints, crossAxisCount);
                  },
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                ),
        );
      },
    );
  }

// Function to build the item container
  Widget _buildItemContainer(
      item, BoxConstraints constraints, int crossAxisCount) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),

      width: 540, // Keeping the width rigid
      height: 200,
      child: Stack(
        children: [
          FutureBuilder<String>(
            future: fetchImageFromApi(item.id!), // Fetch image asynchronously
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child:
                        CircularProgressIndicator()); // Show loader while fetching
              } else if (snapshot.hasError ||
                  !snapshot.hasData ||
                  snapshot.data!.isEmpty) {
                return Center(
                    child: Text('No image found')); // Show error or empty state
              } else {
                try {
                  return Image.memory(
                    base64Decode(snapshot.data!),
                    width: 200,
                    height: 200,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ); // Display the decoded image
                } catch (e) {
                  return Center(
                      child: Text(
                          'Error decoding image')); // Handle decoding error
                }
              }
            },
          ),
          Positioned(
            left: constraints.maxWidth *
                0.1, // Dynamically adjust left margin based on screen width
            right: 0,
            top: 10,
            bottom: 10,
            child: Container(
              width: crossAxisCount == 1
                  ? constraints.maxWidth *
                      0.8 // Use 80% of available width when only one column
                  : constraints.maxWidth *
                      0.6, // Use 60% of available width when two columns
              height: 50,
              padding: const EdgeInsets.all(16.0),
              color: Color.fromRGBO(55, 52, 62, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.09,
                        child: Text(
                          '${item.name}',
                          style: TextStyle(
                            fontSize: AppStyles.getDynamicFontSize(
                              MediaQuery.of(context).size.width,
                            ),
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.literata().fontFamily,
                            color: Color.fromRGBO(255, 244, 226, 1),
                          ),
                        ),
                      ),
                      Text(
                        '\$${item.price}',
                        style: TextStyle(
                          fontSize: AppStyles.getDynamicFontSize(
                            MediaQuery.of(context).size.width,
                          ),
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: Color.fromRGBO(228, 198, 32, 1),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${item.itemDescription}',
                    style: TextStyle(
                      fontSize: AppStyles.getDynamicFontSize(
                        MediaQuery.of(context).size.width * 0.75,
                      ),
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      color: Color.fromRGBO(144, 163, 177, 1),
                    ),
                  ),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Icon(Icons.add_shopping_cart_rounded,color: Colors.black,),
                    )
                  ],
                )
                ],
              ),
            ),
          ),
        ],
      ),
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

      // Check if "Departments" key exists and is a list
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
}