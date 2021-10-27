import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshare/views/moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  bool checkTip = false;

  //สร้างตัวควบคุม TextField แล้วอย่าลืมเอาไปผูกกับ TextField
  TextEditingController txMoney = TextEditingController();
  TextEditingController txPerson = TextEditingController();
  TextEditingController txTip = TextEditingController();

  //เมธอด -> โค้ดแสดง Dialog เตือน โดยจะรับข้อความมาแสดงที่ Dialog
  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text(
          'แชร์เงินกันเถอะ',
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 45.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 120.0,
              ),
              SizedBox(
                height: 45.0,
              ),
              Padding(
                // padding: const EdgeInsets.only(
                //   left: 40.0,
                //   right: 40.0,
                // ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0, //ระยะห่างซ้ายขวา
                  // vertical: 40.0, ระยะห่างบนล่าง
                ),
                child: TextField(
                  controller: txMoney,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Colors.deepPurple,
                    ),
                    hintText: 'ป้อนจำนวนเงิน (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                // padding: const EdgeInsets.only(
                //   left: 40.0,
                //   right: 40.0,
                // ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0, //ระยะห่างซ้ายขวา
                  // vertical: 40.0, ระยะห่างบนล่าง
                ),
                child: TextField(
                  controller: txPerson,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.deepPurple,
                    ),
                    hintText: 'ป้อนจำนวนคน (คน)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (data) {
                      //โค้ดอะไรก็ตามที่มีผลต่อการแสดงผล
                      //ต้องเขียนอยู่ภายใต้คำสั่ง setState
                      setState(() {
                        if (data != null) {
                          checkTip = data;
                          if (data == false) {
                            txTip.text = '';
                          }
                        }
                      });
                    },
                    value: checkTip,
                    side: BorderSide(
                      color: Colors.deepPurple,
                    ),
                    activeColor: Colors.deepPurple,
                    checkColor: Colors.yellow,
                  ),
                  Text(
                    'ทิปให้พนักงานเสริฟ',
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                // padding: const EdgeInsets.only(
                //   left: 40.0,
                //   right: 40.0,
                // ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0, //ระยะห่างซ้ายขวา
                  // vertical: 40.0, ระยะห่างบนล่าง
                ),
                child: TextField(
                  controller: txTip,
                  enabled: checkTip,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.deepPurple,
                    ),
                    hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 45.0,
              ),
              ElevatedButton(
                onPressed: () {
                  //ตรวจสอบป้อน (validate) หรือยังในสิ่งที่ต้องป้อน ถ้ายั้งแสดง dialog เตือน
                  if (txMoney.text.length == 0) {
                    showWarningDialog(context, 'ป้อนเงินด้วยจ้าาา....');
                  } else if (txPerson.text.length == 0) {
                    showWarningDialog(context, 'ป้อนคนด้วยจ้าาา....');
                  } else {
                    //ตรวจสอบทิป
                    if (checkTip == true) {
                      if (txTip.text.length == 0) {
                        showWarningDialog(context, 'ป้อนทิปด้วยจ้าาา....');
                        return; //ออกจากการทำงาน
                      }
                    }

                    //คำนวณ
                    double money = 0;
                    int person = 0;
                    double tip = 0;
                    double moneyShare = 0;

                    //แปลงสิ่งที่ป้อนใน TextField ให้เป็นตัวเลขเพื่อคำนวณ
                    money = double.parse(txMoney.text);
                    person = int.parse(txPerson.text);
                    tip = checkTip == true ? double.parse(txTip.text) : 0;
                    moneyShare = (money + tip) / person;

                    //ส่งค่าทั้งหมดไปแสดงผลที่หน้า MoneyShareUI
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return MoneyshareUI(
                          money: money,
                          person: person,
                          tip: tip,
                          moneyShare: moneyShare,
                        );
                      }),
                    );
                  }
                },
                child: Text(
                  'คำนวณ',
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    55.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      55.0,
                    ),
                  ),
                  primary: Colors.deepPurple, // สีปุ่ม
                  elevation: 5.0, //เงา
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //เคลียหน้าจอให้ทุกอย่างเหมือนตอนเริ่มเข้าแอปฯ มาใหม่ๆ
                  setState(() {
                    txMoney.text = '';
                    txPerson.text = '';
                    txTip.text = '';
                    checkTip = false;
                  });
                },
                icon: Icon(
                  Icons.refresh,
                ),
                label: Text(
                  'ยกเลิก',
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    55.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      55.0,
                    ),
                  ),
                  primary: Colors.red, // สีปุ่ม
                  elevation: 5.0, //เงา
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Created by BC SAU 2021',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF454545),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
