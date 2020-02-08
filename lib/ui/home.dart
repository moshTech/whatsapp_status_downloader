import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dashboard.dart';

// final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final String version = '1.0.0';
  var html =
      "<h3><b>How To Use?</b></h3><p>- Check the Desired Status/Story...</p><p>- Come Back to App, Click on any Image or Video to View...</p><p>- Click the Save Button...<br />The Image/Video is Instantly saved to your Galery :)</p><p>- You can also Use Multiple Saving. [to do]</p>";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Status Downloader'),
        backgroundColor: Colors.teal,
        bottom: TabBar(
          labelPadding: EdgeInsets.symmetric(vertical: 10.0),
          indicatorColor: Colors.tealAccent,
          // indicatorPadding: EdgeInsets.symmetric(horizontal: 24.0),
          tabs: [
            Text(
              'IMAGES',
            ),
            Text(
              'VIDEOS',
            ),
          ],
        ),
      ),
      body: Dashboard(),
      backgroundColor: Colors.white,
      drawer: Container(
        width: MediaQuery.of(context).size.width * .80,
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                accountName: Text(
                  'Status Downloader',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text('Version: $version'),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/logo.jpeg'),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: IconTheme(
                    data: new IconThemeData(color: Color(0xff757575)),
                    child: Icon(Icons.info)),
                title: Text('About Us'),
                onTap: () {
                  _launchAboutURL();
                },
              ),
              ListTile(
                leading: IconTheme(
                    data: new IconThemeData(color: Color(0xff757575)),
                    child: Icon(Icons.star_border)),
                title: Text('Rate Us'),
                onTap: () {
                  _launchURL();
                },
              ),
              ListTile(
                leading: IconTheme(
                    data: IconThemeData(color: Color(0xff757575)),
                    child: Icon(Icons.share)),
                title: Text('Share With Friends'),
                onTap: () {
                  Share.share(
                      'check out my whatsApp status downloader https://github.com/moshTech/',
                      subject: 'Look what I made!');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://github.com/moshTech/whatsApp_status_downloader';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchAboutURL() async {
    const url = 'https://github.com/moshTech';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
