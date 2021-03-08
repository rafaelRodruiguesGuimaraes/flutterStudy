import 'package:flutter/material.dart';

import 'app_controller.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageStates();
  }
}

class HomePageStates extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipOval(
                  child: Image.network(
                      'https://scontent-gru1-2.xx.fbcdn.net/v/t1.0-9/74308636_2774066505939179_2798541002913087488_n.jpg?_nc_cat=103&ccb=3&_nc_sid=09cbfe&_nc_ohc=yJpJCh5DYX8AX80tV-4&_nc_ht=scontent-gru1-2.xx&oh=d5e8c07c88ca62751781aedda4b50237&oe=60683DBF'),
                ),
                accountName: Text('Rafael Guimarães'),
                accountEmail: Text('rafarodgui@hotmail.com')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Titulo do menu'),
              subtitle: Text('Tela de inicio'),
              onTap: () {
                print('Olar');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [CustomSwitch()],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Text('contador: $counter'),
            Container(
              height: 40,
            ),
            CustomSwitch(),
            Container(
              height: 50,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                ]),
            Container(height: 15),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              child: Text('Voltar'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Icon(Icons.add)),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
