import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/modules/offers/points/cubit/points_cubit.dart';
import 'package:queen_care/modules/offers/points/widget/points_prize_widget.dart';

class ReplaceMyPoints extends StatelessWidget {
  final TabController tabController;
  const ReplaceMyPoints({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => PointsCubit()..getMyPointsPrize(),
      child: BlocConsumer<PointsCubit, PointsState>(
        listener: (context, state) {},
        builder: (context, state) {

          final List<String> myPointsPrizeList =
              PointsCubit.get(context).myPointsPrizeList;
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    child: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: darkGrey2,
                    ),
                    onTap: () {
                      tabController.animateTo(10);
                    },
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'استبدال نقاطي',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.1,
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'يمكنك استبدال النقاط بإحدى الجوائز التالية',
                    style: TextStyle(
                      color: darkGrey2,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Expanded(
                    child: ListView.builder(

                        itemCount: myPointsPrizeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PointsPrizeWidget(
                            name: myPointsPrizeList[index],
                            onTap: () {},
                          );
                        })),
                const Spacer(),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

