import 'package:flutter/material.dart';
import 'package:value_up/presentation/home/small_group_detail_view.dart';

class SmallGroupListView extends StatefulWidget {
  const SmallGroupListView({Key? key}) : super(key: key);

  @override
  State<SmallGroupListView> createState() => _SmallGroupListViewState();
}

class _SmallGroupListViewState extends State<SmallGroupListView> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 15),
      physics: ClampingScrollPhysics(),
      // bounce 효과를 제거 할 수 있다.
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          color: Colors.black.withOpacity(0.1),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedItemIndex = index;
              print(_selectedItemIndex);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SmallGroupDetailView();
                  },
                ),
              );
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.asset(
                    'assets/images/landing_page.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 20, top: 2),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 70,
                              height: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[350],
                                borderRadius: BorderRadius.circular(500),
                              ),
                              child: Text(
                                '맥주한잔',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Icon(Icons.location_on_outlined),
                            Text(
                              'Clarke Quay Stn.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: const [
                            Icon(Icons.female_outlined),
                            SizedBox(height: 5, width: 5),
                            Text(
                              "2/3",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5, width: 5),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: const [
                            Icon(Icons.male_outlined),
                            SizedBox(height: 5, width: 5),
                            Text(
                              "2/3",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5, width: 5),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              SizedBox(
                                height: 20,
                                width: 22,
                                //color: Colors.white,
                                child: Icon(Icons.star_border, size: 15.0),
                              ),
                              SizedBox(width: 3),
                              Text("likes"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
