import 'package:beasiswa/beasiswa_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomeContent extends StatefulWidget {
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(height: 135),
        Expanded(
          flex: 1,
          child: PageView(
            controller: _pageViewController,
            children: [
              Image.network(
                  'https://www.scholarsofficial.com/wp-content/uploads/2018/03/beasiswa-unggulan-mailma-2.png'),
              Image.network(
                  'https://www.scholarsofficial.com/wp-content/uploads/2018/03/beasiswa-unggulan-mailma-2.png'),
              Image.network(
                  'https://www.scholarsofficial.com/wp-content/uploads/2018/03/beasiswa-unggulan-mailma-2.png'),
            ],
          ),
          // child: PageViewExample(),
        ),
        const SizedBox(height: 3),
        Indikator(pageViewController: _pageViewController),
        BeasiswaWidget(),
      ],
    );
  }
}

class Indikator extends StatelessWidget {
  const Indikator({
    super.key,
    required PageController pageViewController,
  }) : _pageViewController = pageViewController;

  final PageController _pageViewController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageViewController,
      count: 3,
      effect: const JumpingDotEffect(
        dotWidth: 5,
        dotHeight: 5,
        dotColor: Colors.grey,
        activeDotColor: Colors.blue,
      ),
    );
  }
}

class BeasiswaWidget extends StatelessWidget {
  const BeasiswaWidget({
    super.key,
  });

  void _showBeasiswaDetails(BuildContext context, String beasiswaName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        
return AlertDialog(
          title: Text('Detail Beasiswa'),
          content: Text('Anda memilih beasiswa $beasiswaName'),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlueAccent),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => _showBeasiswaDetails(context, 'Beasiswa LPDP'),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        children: [
                          Text('Beasiswa LPDP',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Beasiswa studi lanjut dalam dan luar negri',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  InkWell(
                    onTap: () => _showBeasiswaDetails(context, 'Beasiswa BCA Finance'),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'Beasiswa BCA Finance',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Beasiswa untuk mahasiswa berprestasi',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  InkWell(
                     onTap: () => _showBeasiswaDetails(context, 'Beasiswa Djarum Plus'),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        children: [
                          Text('Beasiswa Djarum Plus',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Untuk mahasiswa prestasi dan aktif organisasi',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => BeasiswaData());
                        },
                        child: const Text(
                          'Buka',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
