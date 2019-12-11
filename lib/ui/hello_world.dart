import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//如果用户与 widget 交互，widget 会发生变化，那么它就是_有状态的_,此处暂时不需要交互，就是无状态的
class MyApp extends StatelessWidget{

  //  1⃣标题行组件
  Widget titleSection  = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500]
                ),
              )
            ],
          ),
        ),
//       使用有状态的组件替代静态组件，处理用户交互问题
       FavoriteWidget(),
//        Icon(
//          Icons.star,
//          color: Colors.red[500],
//        ),
//        Text('41'),
      ],
    ),
  );

//  2⃣可复用的图文混排(竖直方向图片加文字)函数，返回一个可直接显示的组件
  Column _buildButtonColumn(Color color,IconData icon,String label){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,color: color,),
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
        )
      ],
    );
  }

//  4⃣ 文本区域组件
  Widget textSection  = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,//自动换行
    ),
  );


  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;
//    3⃣图文混排复用按钮区域 需要用到context，此组件暂时写在build函数中
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        appBar: AppBar(
          title: Text('秦时明月'),
        ),
//        body: Column(  //最后使用list view代替Column ，当 app 运行在某个小设备上时，ListView 支持 app body 的滚动。
        body: ListView(
          children: <Widget>[
          //  5⃣图片区域组件
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,// 1⃣标题行组件
            buttonSection,// 3⃣图文混排复用按钮区域组件
            textSection,// 4⃣ 文本区域组件
          ],
        ),
      ),
    );
  }


}

//如果用户与 widget 交互，widget 会发生变化，那么它就是_有状态的
//FavoriteWidget 类管理自己的状态，因此它通过重写 createState() 来创建状态对象。框架会在构建 widget 时调用 createState()。
//将相关状态关联的组件放在同一个类中进行统一管理
class FavoriteWidget extends StatefulWidget{
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();

//  @override
//  State<StatefulWidget> createState() {
//    // 创建State<StatefulWidget> 的子类 _FavoriteWidgetState代替
//    return null;
//  }

}
// 创建State<StatefulWidget> 的子类
class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = true;
  int _favoriteCount = 41;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
              icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
              onPressed: _toggleFavorite,//点击调用方法去改变状态，调用setState方法，重新build
              color: Colors.red[500],
          ),
        ),
//     SizedBox固定宽度位置
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

  /**
   * 按下 IconButton 时会调用 _toggleFavorite() 方法，然后它会调用 setState()。
   * 调用 setState() 是至关重要的，因为这告诉框架，widget 的状态已经改变，应该重绘.
   * 就是重新执行build方法
   */
  void _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _favoriteCount -= 1;
        _isFavorited  = false;
      }else{
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

}
