import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'package:flutter2_app/shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//import 'service//service_method.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height:1334)..init(context);//初始化屏幕分辨率
    return Scaffold(
      body:EasyRefresh(
        child: ListView(
          children: <Widget>[
            PositionDiy(),
            SwiperDiy(),
            TipDiy(),
            TopNavigator(),
            RollTipDiy(),
            ValueAdded(),
            GroupBuying(),
            TopSellingList()
          ],
        ),
      ),
    );
  }
}
//位置和搜索
class PositionDiy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(210),
      width: ScreenUtil().setWidth(750),
      color: Colors.pink,
      child:Row(
        children:[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(Icons.my_location)
          ),
          Text("福州",style: TextStyle(fontSize: 25,color: Colors.white)),
          Text("(当前城市)",style: TextStyle(fontSize: 12,color: Colors.white)),
          Container(
            width: 170,
            height: 30,

            margin: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              border: Border.all(color: Colors.yellow, width: 3.0), //边框
              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),  //倒圆角,
            ),
          //  child:Icon(Icons.my_location)
          )
        ]
      )
    );
  }
}

class SwiperDiy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
    //设置圆角度，也可以不设置有默认值
      shape: RoundedRectangleBorder(
        //形状
        //修改圆角
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //阴影高度
      elevation: 4.0,
      child: Container(
        height: ScreenUtil().setHeight(363),
        width: ScreenUtil().setWidth(750),
        child: Swiper(
          itemCount: 3,
          itemBuilder: (BuildContext context,int index){
           return Image(
                image: AssetImage("images/img1.png"),
                width: 100.0
            );
          },
          pagination: SwiperPagination(),
          autoplay: true,
        ),
      )
    );
  }
}

// 提示
class TipDiy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /* if(navigatorList.length>10){
      navigatorList.removeRange(10, navigatorList.length);
    }*/
    return Container(
      height: ScreenUtil().setHeight(120),
      padding: EdgeInsets.all(3.0),
      child:Row(
        children: [
          Icon(Icons.radio),
          Text("亲爱的顾客,线上商城下单正常情况下72小时内发货")
        ],
      )
    );
  }
}

// 顶部导航
class TopNavigator extends StatelessWidget {

  List navigatorList = new List();

  TopNavigator({this.navigatorList});

  Widget _gradViewItemUi(BuildContext context,item){
    return InkWell(
      onTap: (){print("点击了导航");},
      child: Column(
        children: <Widget>[
          Image(
              image: AssetImage("images/img1.png"),
              width: 100.0
          ),

         // Image.network(item['image'],width: ScreenUtil().setWidth(95),),
         // Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   /* if(navigatorList.length>10){
      navigatorList.removeRange(10, navigatorList.length);
    }*/
    return Container(
      height: ScreenUtil().setHeight(320),
     // padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.all(4.0),
        children:<Widget>[
          Image(
            image: AssetImage("images/img1.png"),
              width: 100.0
          ),
        ]
        /*children: navigatorList.map((item){
          return _gradViewItemUi(context, item);
        }).toList(),*/
      ),
    );
  }
}


// 滑动的三个按钮
class RollTipDiy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /* if(navigatorList.length>10){
      navigatorList.removeRange(10, navigatorList.length);
    }*/
    return Container(
      height: 80,
      child: ListView(
        scrollDirection:Axis.horizontal ,
        children: <Widget>[
          new ListItem(context,"images/img9.png","会员中心"),
          new ListItem(context,"images/img10.png","优惠卷中心"),
          new ListItem(context,"images/img11.png","优惠卷中心"),
        ],
      )
    );
  }
}
//ListView 的 子item
class ListItem extends StatelessWidget {
  String image_url;
  String name;

  ListItem(BuildContext mContext, String img, String name) {
    image_url = img;
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      //设置圆角度，也可以不设置有默认值
        shape: RoundedRectangleBorder(
          //形状
          //修改圆角
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          width: ScreenUtil().setWidth(320),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(13.0),
                child:Image(
                    image: AssetImage(image_url),
                    fit: BoxFit.fill
                ),
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                child:Text(name,style: TextStyle(fontSize: 15, color: Colors.red))
              ),
            ]
          )
        )
    );
  }
}

class EachHeading extends StatelessWidget {
  String LeftTip1;
  String RightTip2;
  EachHeading(String leftTip, String rightTip) {
    LeftTip1 = leftTip;
    RightTip2 = rightTip;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Text(LeftTip1, style: TextStyle(fontSize: 25, color: Colors.black)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(150, 10, 10, 10),
          child:Text(RightTip2, style: TextStyle(fontSize: 12, color: Colors.black)),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
            child:Icon(Icons.arrow_right)
        )
      ],
    );
  }
}

//超值优化
//ListView 的 子item
class ValueAdded extends StatelessWidget {
  String image_url;
  ListItem(BuildContext mContext, String url) {
    image_url = url;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        //测试Row对齐方式，排除Column默认居中对齐的干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EachHeading('超值优惠','更多'),
            Row(
              children: <Widget>[
                TopImaBottomText(),
                TopTextBottomImg(),
              ],
            ),
            Column(
              children: [
                RightTextLeftmImg(),
                RightImgLeftText()
              ],
            )
          ]
      ),
    );
  }
}

//上图下文字
class TopImaBottomText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /* if(navigatorList.length>10){
      navigatorList.removeRange(10, navigatorList.length);
    }*/
 //   Widget avatar = Image.asset("imgs/avatar.png", width: 60.0);
    return Card(

      //设置圆角度，也可以不设置有默认值
      shape: RoundedRectangleBorder(
        //形状
        //修改圆角
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //阴影高度
      elevation: 4.0,
      child: Container(
        width: 172,
        height: 300,
        child: Column(
          children:[
            Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
              child:
             /* ClipRRect( //剪裁为圆角矩形
                borderRadius: BorderRadius.circular(5.0),
                child: avatar,
              ),*/
               Image(
                  image: AssetImage("images/img12.png"),
                  fit: BoxFit.fill,
                  height: 120,
              ),
            ),
            TitleItem()
          ]
        ),
      )
    );
  }
}

class TitleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                  child: Text('春日大放假', style: TextStyle(fontSize: 15, color: Colors.black)),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child:Icon(Icons.forward)
                ),
              ],
            )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: Text('ZUI高直降300元', style: TextStyle(fontSize: 15, color: Colors.black)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: Text('原价368.0RMB', style: TextStyle(fontSize: 12,
              decoration: TextDecoration.lineThrough,decorationColor: Colors.black)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: Text('限时价', style: TextStyle(fontSize: 20, color: Colors.red)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: Text('168.5RMB', style: TextStyle(fontSize: 20, color: Colors.red)),
        ),
      ],
    );
  }
}

//上字下图
class TopTextBottomImg extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /* if(navigatorList.length>10){
      navigatorList.removeRange(10, navigatorList.length);
    }*/
    //   Widget avatar = Image.asset("imgs/avatar.png", width: 60.0);
    return Card(
    //设置圆角度，也可以不设置有默认值
      shape: RoundedRectangleBorder(
        //形状
        //修改圆角
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //阴影高度
      elevation: 4.0,
      child: Container(
        width: 172,
        height: 300,
        child: Column(
          children:[
            TitleItem(),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
              child:
                  /* ClipRRect( //剪裁为圆角矩形
                borderRadius: BorderRadius.circular(5.0),
                child: avatar,
              ),*/
              Image(
                image: AssetImage("images/img12.png"),
                fit: BoxFit.fill,
                height: 140,
              ),
            ),
          ]
        ),
      )
    );
  }
}

//左字右图
class RightTextLeftmImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
    //设置圆角度，也可以不设置有默认值
      shape: RoundedRectangleBorder(
        //形状
        //修改圆角
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //阴影高度
      elevation: 4.0,
      child: Container(
        width: 500,
        height: 170,
        child: Row(
          children:[
            TitleItem(),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
              child:
              /* ClipRRect( //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),*/
              Image(
                image: AssetImage("images/img12.png"),
                fit: BoxFit.fill,
                height: 140,
              ),
            ),
          ]
        ),
      )
    );
  }
}

//左图右字
class RightImgLeftText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
    //设置圆角度，也可以不设置有默认值
      shape: RoundedRectangleBorder(
        //形状
        //修改圆角
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //阴影高度
      elevation: 4.0,
      child: Container(
        width: 500,
        height: 170,
        child: Row(
          children:[
            Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
              child:
              Image(
                image: AssetImage("images/img12.png"),
                fit: BoxFit.fill,
                height: 140,
              ),
            ),
            TitleItem(),
          ]
        ),
      )
    );
  }
}

// 团购专区

class GroupBuying extends StatelessWidget {

  String image_url;
  ListItem(BuildContext mContext, String url) {
    image_url = url;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //获取设备屏幕长宽
    print("--------------$size"); //我的设备宽 360.0  720.0
    final width = size.width;
    final height = size.height;
    // TODO: implement build
    return new Container(
      //width: 300,
      //height: 300,
      child: Column(
      //测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          EachHeading('团购专区','更多'),
          Column(
            children: [
              GroupBuyingItem()
            ],
          )
        ]
      ),
    );
  }
}
//
class GroupBuyingItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /* if(navigatorList.length>10){
      navigatorList.removeRange(10, navigatorList.length);
    }*/
    return Card(
      //设置圆角度，也可以不设置有默认值
      shape: RoundedRectangleBorder(
        //形状
        //修改圆角
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //阴影高度
      elevation: 4.0,
      child: Container(
        width: 500,
        height: 200,
        child: Column(
          children:[
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  child:  Image(
                    image: AssetImage("images/img12.png"),
                    width: 150,
                    height: 140,
                  ),
                ),
                Expanded(
                  child: Column(
                      children:[
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                          child:Text("2020春季爆款碎花连衣裙,2020春季爆款碎花连衣裙",
                              style:TextStyle(fontSize: 12, color: Colors.black),maxLines: 2,
                              overflow: TextOverflow.ellipsis),

                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
                              child: Text('2人团', style: TextStyle(fontSize: 12, color: Colors.black)),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text('原价:269.0RMB', style: TextStyle(fontSize: 12,
                                  decoration: TextDecoration.lineThrough,decorationColor: Colors.black)),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                              child: Text('169', style: TextStyle(fontSize: 12, color: Colors.black)),
                            ),
                            Container(
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                color: Color(0XFF2B95E9),
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: Text('立即开团', style: TextStyle(fontSize: 12, color: Colors.black)),
                            )
                          ],
                        ),
                      ]
                  ),
                ),
              ],
            ),
            HorizontalLine(),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
              child:  Text('活动倒计时: 1天12小时50分30秒'),
            ),
          ]
        ),
      )
    );
  }
}

class HorizontalLine extends StatelessWidget {
  final double dashedWidth;
  final double dashedHeight;
  final Color color;

  HorizontalLine({
    this.dashedHeight = 1,
    this.dashedWidth = double.infinity,
    this.color = const Color(0xFF979797),
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: dashedWidth, height: dashedHeight, color: color);
  }
}

//本期推荐

//精品推荐

//热卖排行
class TopSellingList extends StatelessWidget {

  String image_url;
  ListItem(BuildContext mContext, String url) {
    image_url = url;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //获取设备屏幕长宽
    print("--------------$size"); //我的设备宽 360.0  720.0
    // TODO: implement build
    return new Container(
      child: Column(
        //测试Row对齐方式，排除Column默认居中对齐的干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EachHeading('热卖排行','更多'),
            Column(
              children: [
                RightTextLeftmImg(),
                RightTextLeftmImg(),
              ],
            )
          ]
      ),
    );
  }
}

//左字右图
class TopSellingListItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /* if(navigatorList.length>10){
      navigatorList.removeRange(10, navigatorList.length);
    }*/
    return Card(
      //设置圆角度，也可以不设置有默认值
      shape: RoundedRectangleBorder(
      //形状 修改圆角
      borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //阴影颜色
      color: Colors.orangeAccent,
      //阴影高度
      elevation: 4.0,
      child: Container(
        width: 500,
        height: 160,
        child: Row(
          children:[
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child:Text("2020春季爆款碎花连衣裙,2020春季爆款碎花连衣裙",
                        style:TextStyle(fontSize: 12, color: Colors.black),maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child:Text("2020春季爆款碎花连衣裙,2020春季爆款碎花连衣裙",
                        style:TextStyle(fontSize: 12, color: Colors.black),maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text('原价:269.0RMB', style: TextStyle(fontSize: 12,
                        decoration: TextDecoration.lineThrough,decorationColor: Colors.black)),
                  ),
                  Row(
                    children: [
                      Text("会员价", style:TextStyle(fontSize: 12, color: Colors.black),maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                      Text("169.0", style:TextStyle(fontSize: 12, color: Colors.black),maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      Text("RMB", style:TextStyle(fontSize: 12, color: Colors.black),maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child:  Image(
                image: AssetImage("images/img12.png"),
                width: 150,
                height: 140,
              ),
            )
          ],
        ),
      ),
    );
  }
}