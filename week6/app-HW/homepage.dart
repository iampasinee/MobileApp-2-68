import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'result.dart';

class LotteryInput extends StatefulWidget {
  const LotteryInput({super.key});

  @override
  State<LotteryInput> createState() => _LotteryInputState();
}

class _LotteryInputState extends State<LotteryInput> {
  var num1;
  var num2;
  var num3;
  var num_buy;
  var num_lot = "";
  String c_err = "";

  final num1con = TextEditingController();
  final num2con = TextEditingController();
  final num3con = TextEditingController();
  final num_buycon = TextEditingController();

  void initState() {
    super.initState();
    num1con.addListener(updatetext);
    num2con.addListener(updatetext);
    num3con.addListener(updatetext);
    num_buycon.addListener(updatetext);
  }

  void updatetext() {
    setState(() {
      num1 = num1con.text;
      num2 = num2con.text;
      num3 = num3con.text;
      num_buy = num_buycon.text;

      if (num3.toString().isNotEmpty &&
          num2.toString().isNotEmpty &&
          num1.toString().isNotEmpty) {
        num_lot = "";
        num_lot += num3.toString() + num2.toString() + num1.toString();
      } else {
        num_lot = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'LOTTERY N3',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDigitInput("หลักที่ 3", "3", num3con),
              _buildDigitInput("หลักที่ 2", "2", num2con),
              _buildDigitInput("หลักที่ 1", "1", num1con),
            ],
          ),
          SizedBox(height: 50),
          Text(
            "จำนวนเงินที่ต้องการซื้อ",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue[700],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24, color: Colors.redAccent),
                  controller: num_buycon,
                  decoration: InputDecoration(
                    hintText: 'ใส่จำนวนเงิน',
                    hintStyle: TextStyle(
                      color: Colors.grey.withValues(alpha: 0.3),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 3,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Text(
                "บาท",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              final int? number = int.tryParse(num_buycon.text);

              setState(() {
                c_err = "";
                if (num1con.text.isEmpty ||
                    num2con.text.isEmpty ||
                    num3con.text.isEmpty) {
                  c_err = "กรุณากรอกข้อมูลให้ครบถ้วน!";
                } else if (num_buycon.text.isEmpty) {
                  c_err = "กรุณากรอกข้อมูลให้ครบถ้วน!";
                } else if (number == null) {
                  c_err = "กรุณากรอกจำนวนเงินเป็นตัวเลขเท่านั้น!";
                }
              });

              if (num_lot.isNotEmpty && number != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LotteryResult(
                        Number_lot: num_lot,
                        Price_buy: num_buycon.text,
                      );
                    },
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0.0),
              fixedSize: Size(300, 50),
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 7,
              shadowColor: Colors.blue,
              side: BorderSide(color: Colors.blue[800]!, width: 1),
              shape: StadiumBorder(),
            ),
            child: Text("ตรวจผลรางวัล"),
          ),
          SizedBox(height: 50),
          if (c_err.isNotEmpty)
            Text(c_err, style: TextStyle(color: Colors.red, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildDigitInput(String label, String hint, control) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue[700],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 60,
          child: TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 1,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: Colors.blue[700],
            ),
            controller: control,
            decoration: InputDecoration(
              counterText: "",
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.2)),
              contentPadding: EdgeInsets.symmetric(vertical: 8),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
