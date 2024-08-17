import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/firebase_helper.dart';
import '../index/main_index.dart';
import '../../providers/custom_auth_provider.dart';

class ExchangeInfoScreen extends StatefulWidget {
  final String uid;
  final int myCredit;
  final String memberType;
  final Map<String, dynamic> post;

  ExchangeInfoScreen({
    required this.uid,
    required this.myCredit,
    required this.memberType,
    required this.post,
  });

  @override
  _ExchangeInfoScreenState createState() => _ExchangeInfoScreenState();
}

class _ExchangeInfoScreenState extends State<ExchangeInfoScreen> {
  bool _canApply = false; // _canApply 변수 선언

  @override
  void initState() {
    super.initState();
    _initializeCheckApply(); // 화면 빌드 전에 checkApplyExchange 호출
  }

  Future<void> _initializeCheckApply() async {
    _canApply = await FirebaseHelper.checkApplyExchange(
        widget.post['docId'], widget.uid);
    setState(() {}); // 상태 갱신
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("교환 상세"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "공고 정보",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
              SizedBox(height: 3),
              Divider(
                color: Color.fromARGB(255, 234, 234, 234),
                thickness: 2,
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "  기업명",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '${widget.post['inc']}  ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color.fromARGB(255, 234, 234, 234),
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "  상품명",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '${widget.post['goodsName']}  ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color.fromARGB(255, 234, 234, 234),
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "  필요 크레딧",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '${widget.post['needCredit']} 크레딧  ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color.fromARGB(255, 234, 234, 234),
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "  모집 인원",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '${widget.post['maxHeadcounts']}명  ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color.fromARGB(255, 234, 234, 234),
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "  현재 인원",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '${widget.post['currentHeadcounts']}명  ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color.fromARGB(255, 234, 234, 234),
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "기업 소개",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
              SizedBox(height: 3),
              Divider(
                color: Color.fromARGB(255, 234, 234, 234),
                thickness: 2,
              ),
              SizedBox(height: 5),
              Card(
                margin: EdgeInsets.all(5.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.8,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.post['imgUrl']),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // 배경색
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          widget.post['incIntroduction'],
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "지원 사업 의의",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
              SizedBox(height: 3),
              Divider(
                color: Color.fromARGB(255, 234, 234, 234),
                thickness: 2,
              ),
              SizedBox(height: 5),
              Card(
                margin: EdgeInsets.all(5.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // 배경색
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      widget.post['supportReason'].replaceAll('\\n', '\n'),
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 30.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: widget.memberType == '메이트' && _canApply
                ? () async {
                    final customAuthProvider =
                        Provider.of<CustomAuthProvider>(context, listen: false);
                    bool success = false;
                    success = await FirebaseHelper.applyExchange(
                        widget.uid, widget.myCredit, widget.post['docId']);
                    if (success) {
                      await customAuthProvider.fetchUserInfo(widget.uid);
                      MainIndex.globalKey.currentState
                          ?.navigateToExchangeScreen();
                      Navigator.pop(context);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('오류'),
                            content: Text('신청이 실패했습니다.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('확인'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: widget.memberType == '메이트' && _canApply
                  ? Color.fromARGB(255, 245, 174, 168)
                  : Colors.grey,
              foregroundColor: Colors.black,
            ),
            child: Text(
              '신청하기',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
