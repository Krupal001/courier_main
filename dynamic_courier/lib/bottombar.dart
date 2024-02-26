import 'package:flutter/material.dart';
import 'package:flutter_projects/src/features/authentication/screens/dashboard/home_screen.dart';
import 'package:flutter_projects/src/features/authentication/screens/notification/notification_services.dart';
import 'package:flutter_projects/src/features/authentication/screens/parcel/Add_location.dart';
import 'package:flutter_projects/src/features/authentication/screens/parcel/parcel_booking_form.dart';
import 'package:flutter_projects/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:flutter_projects/src/repository/authentication_repository.dart';
import 'package:flutter_projects/src/utils/theme/colors/colors.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  NotificationServices notificationServices=NotificationServices();
  final List<Widget> _pages = [
    const Dashboard(),
    const AddLocationPage(),
    const ParcelBookingForm(),
    const ProfileScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: tThemeMain,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'Add Location',
            backgroundColor: tThemeMain,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_sharp),
            label: 'Shipment',
            backgroundColor: tThemeMain,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: tThemeMain,
          ),
        ],
      ),
    );
  }
}
