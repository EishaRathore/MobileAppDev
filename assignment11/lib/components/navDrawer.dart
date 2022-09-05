import 'userData.dart';
import '../theme/theme.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key, required this.userData}) : super(key: key);
  final _fontSize = 16.0;
  final UserData userData;
  final routes = const ['/home', '/transaction'];

  @override
  Widget build(BuildContext context) {
    final _currentRoute = ModalRoute.of(context)!.settings.name;

    return Ink(
      // Change the Background color of the ListView
      color: backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 190,
            child: DrawerHeader(
              margin: EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: FadeInImage(
                      image: NetworkImage(
                        'https://source.unsplash.com/300x300/?fire,green,forest',
                      ),
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                      placeholder: AssetImage('assets/icons/logo.png'),
                      imageErrorBuilder: (_, __, ___) => CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/icons/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    userData.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                  Text(
                    userData.email,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(color: primaryColor),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: _fontSize,
                color: _currentRoute == '/home' ? primaryColor : Colors.white,
              ),
            ),
            selectedTileColor: primaryColor.withOpacity(0.3),
            selected: _currentRoute == '/home',
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (_) => false,
              arguments: userData,
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text(
              'Transactions',
              style: TextStyle(
                fontSize: _fontSize,
                color: _currentRoute == '/transaction'
                    ? primaryColor
                    : Colors.white,
              ),
            ),
            selectedTileColor: primaryColor.withOpacity(0.3),
            selected: _currentRoute == '/transaction',
            onTap: () {
              Navigator.pop(context);

              if (_currentRoute != '/transaction')
                Navigator.pushNamed(
                  context,
                  '/transaction',
                  arguments: userData,
                );

              //Navigator.pushReplacementNamed(context, '/transaction');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Sign Out',
              style: TextStyle(
                fontSize: _fontSize,
                color: !routes.contains(_currentRoute)
                    ? primaryColor
                    : Colors.white,
              ),
            ),
            selectedTileColor: primaryColor.withOpacity(0.3),
            selected: !routes.contains(_currentRoute),
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                elevation: 24.0,
                title: Text('Confirmation'),
                content: Text('Are you sure, you wants to logout?'),
                actions: [
                  ElevatedButton(
                    child: Text('No'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ElevatedButton(
                    child: Text('Yes'),
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (_) => false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
