import 'package:flutter/material.dart';

class MoneyshareUI extends StatefulWidget {
  //สร้างตัวแปรที่จะรับค่าที่ส่งมาจากอีกหน้าหนึ่ง
  double money = 0;
  int person = 0;
  double tip = 0;
  double moneyShare = 0;

  //ที่คอนสตรักเตอร์ นำตัวแปรที่สร้างไว้มากำหนดเพื่อที่จะรับค่าที่ส่งมาจากอีกหน้าหนึ่ง
  MoneyshareUI({
    Key? key,
    required this.money,
    required this.person,
    required this.tip,
    required this.moneyShare,
  }) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text(
          'ผลการแชร์เงิน',
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 100.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเงินที่จะหาร',
              ),
              Text(
                widget.money.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'บาท',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนคนที่จะหาร',
              ),
              Text(
                widget.person.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'บาท',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเงินทิป',
              ),
              Text(
                widget.tip.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'บาท',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'สรุปว่าหารกันคนละ',
              ),
              Container(
                color: Colors.yellow,
                width: MediaQuery.of(context).size.width - 80.0,
                padding: EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                ),
                margin: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.moneyShare.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Text(
                'บาท',
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
