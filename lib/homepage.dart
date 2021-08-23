import 'package:flutter/material.dart';
import 'package:gecko_app/bloodline.dart';
import 'favoitestar.dart';
class HomePage extends StatefulWidget {

  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Gecko Land',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          FavoriteWidget(),
        ],
      ),
    );
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL', () {
            print('call');
        }),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE',(){
            print('Route');
        }),
        _buildButtonColumn(color, Icons.share, 'SHARE', (){
            print('Share');
        }),
      ],
    );
    Widget naviSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.cabin, 'BloodLine', (){
            print('Bloodline');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BloodLine(title: 'blood')),
            );
        }),
        _buildButtonColumn(color, Icons.access_alarms, 'Home', (){
            print('Home');
        }),
      ],
    );
    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Gecko, (suborder Gekkota), any of more than 1,000 species of lizards making up six families of the suborder Gekkota. Geckos are mostly small, usually nocturnal reptiles with a soft skin. They also possess a short stout body, a large head, and typically well-developed limbs. The ends of each limb are often equipped with digits possessing adhesive pads. Most of the species are 3 to 15 cm (1.2 to 6 inches) long, including tail length (about half the total). They have adapted to habitats ranging from deserts to jungles. Some species frequent human habitations, and most feed on insects.',
        softWrap: true,
      ),
    );
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'images/lake.jpeg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          naviSection
        ]
      ),
    );
  }
}
GestureDetector _buildButtonColumn(Color color, IconData icon, String label, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    )
  );
}
