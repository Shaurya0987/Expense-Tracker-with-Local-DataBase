import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    String getCurrentPeriod() {
      final now = DateTime.now();

      const months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      ];

      return "${months[now.month - 1]} ${now.year}";
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.calendar_month_sharp,
              color: Colors.blueAccent,
              size: 25,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Period",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              getCurrentPeriod(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.settings, size: 27),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Container(
                // height: 160,
                decoration: BoxDecoration(
                  color: Colors.blue.shade600,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Spending",style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: 15
                          ),),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            padding: EdgeInsets.symmetric(vertical: 2,horizontal: 9),
                            child: Text("+2.4",style: TextStyle(
                              color: Colors.white
                            ),),
                          )
                        ],
                      ),
                      Text("\$ 1240.50",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 40
                      ),),
                      SizedBox(height: 10,),
                      BudgetProgressBar(percent: 0.4),
                      // SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActivityContainer(title: 'Add', icon: Icons.add, shadeColor: Colors.blue, IconColor:Colors.white ,),
                  ActivityContainer(title: 'Reports', icon: Icons.align_horizontal_left_outlined, shadeColor: Colors.grey.shade300, IconColor:Colors.grey.shade800 ,),
                  ActivityContainer(title: 'Budget', icon: Icons.wallet_rounded, shadeColor: Colors.teal, IconColor:Colors.white ,),
                ],
              ),
              SizedBox(height: 22,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Activity",style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18
                  ),),
                  Text("See All",style: TextStyle(
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),)
                ],
              ),
              SizedBox(height: 13,),
              RecentActivityContainer(title: 'Whole Food Market', date: 'Oct 23', category: 'Fast Food', price: '-\$54.70', icon: Icons.fastfood_rounded, color: Colors.deepOrange,),
              RecentActivityContainer(title: 'Charger Cable', date: 'Oct 23', category: 'Electronics', price: '-\$23.10', icon: Icons.charging_station_rounded, color: Colors.teal,),
              RecentActivityContainer(title: 'Uber Ride', date: 'Oct 22', category: 'Transport', price: '-\$12.50', icon: Icons.car_crash_rounded, color: Colors.grey,),
              RecentActivityContainer(title: 'Spotify Premium', date: 'Oct 21', category: 'Entertainment', price: '-\$9.99', icon: Icons.music_note, color: Colors.blue,),
              RecentActivityContainer(title: 'Salary Deposit', date: 'Oct 17', category: 'Income', price: '+\$30000', icon: Icons.candlestick_chart_rounded, color: Colors.green,),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentActivityContainer extends StatelessWidget {
  final String title;
  final String date;
  final String category;
  final String price;
  final IconData icon;
  final MaterialColor color;
  const RecentActivityContainer({
    super.key, required this.title, required this.date, required this.category, required this.price, required this.icon, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        // height: 100,
        decoration: BoxDecoration(
          
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            leading: CircleAvatar(
              radius: 22,
              backgroundColor: color.shade100,
              child: Icon(icon,color: color.shade600,size: 21,),
            ),
            title: Text(title,style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 17
            ),),
            subtitle: Row(
              children: [
                Text(date,style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14
                ),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(Icons.circle,size: 7,color: Colors.grey,),
                ),
                Text(category,style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14
                ),),
              ],
            ),
            trailing: Text(price,style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w900
            ),),
          ),
        ),
      ),
    );
  }
}

class ActivityContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color shadeColor;
  final Color IconColor;
  const ActivityContainer({
    super.key, required this.title, required this.icon, required this.shadeColor, required this.IconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 108,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: shadeColor,
            child: Icon(icon,color:IconColor,size: icon==Icons.add ? 30 : 25,),
          ),
          SizedBox(height: 15,),
          Text(title,style: TextStyle(
            fontSize: 16
          ),)
        ],
      ),
    );
  }
}

class BudgetProgressBar extends StatelessWidget {
  final double percent; 
  final String label;
  final Color backgroundColor;
  final Color fillColor;

  const BudgetProgressBar({
    super.key,
    required this.percent,
    this.label = "of budget",
    this.backgroundColor = Colors.white30,
    this.fillColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  // Background bar
                  Container(
                    height: 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  // Filled bar
                  Container(
                    height: 6,
                    width: constraints.maxWidth * percent.clamp(0.0, 1.0),
                    decoration: BoxDecoration(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        const SizedBox(width: 12),

        Text(
          "${(percent * 100).toInt()}% $label",
          style: TextStyle(
            color: fillColor.withOpacity(0.9),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
