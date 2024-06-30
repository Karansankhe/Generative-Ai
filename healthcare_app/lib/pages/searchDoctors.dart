import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchDoctors extends StatelessWidget{
  const SearchDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(242, 241, 249, 1),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: FaIcon(FontAwesomeIcons.chevronLeft, size: 15,),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(242, 241, 249, 1),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: FaIcon(FontAwesomeIcons.user, size: 15,),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(242, 241, 249, 1),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: FaIcon(FontAwesomeIcons.map, size: 15,),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Choose\nYour Doctor", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  const Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(242, 241, 249, 1),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: FaIcon(FontAwesomeIcons.bookmark, size: 15,),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(242, 241, 249, 1),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: FaIcon(FontAwesomeIcons.ellipsisVertical, size: 15,),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const DoctorInfo(),
            const SizedBox(height: 20),
            const DoctorInfo(),
            const SizedBox(height: 20),
            const DoctorInfo(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget{
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.width*0.9,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(90, 178, 255, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text("4.9", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. Hertzler", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),),
                    Text("Family Medicine", style: TextStyle(fontSize: 15, color: Colors.white),),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: FaIcon(FontAwesomeIcons.bookmark, size: 15,),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(27),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\u{20B9}1500", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                        Text("Per Session", style: TextStyle(fontSize: 12,),),
                      ],
                    ),
                    SizedBox(width: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("M.B.B.S", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                        Text("Mumbai University", style: TextStyle(fontSize: 12,),),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text("Schedule", style: TextStyle(fontSize: 12,),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ScheduleDate(date: 7, isBooked: false,),
                            ScheduleDate(date: 8, isBooked: false,),
                            ScheduleDate(date: 9, isBooked: false,),
                            ScheduleDate(date: 10, isBooked: true,),
                            ScheduleDate(date: 11, isBooked: false,),
                            ScheduleDate(date: 12, isBooked: true,),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ScheduleDate(date: 13, isBooked: true,),
                            ScheduleDate(date: 14, isBooked: true,),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(23, 20, 51, 1),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white, size: 15,),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

}

class ScheduleDate extends StatelessWidget{
  const ScheduleDate({super.key, required this.date, required this.isBooked});

  final int date;
  final bool isBooked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      decoration: BoxDecoration(
        color: isBooked ? const Color.fromRGBO(90, 178, 255, 1) : const Color.fromRGBO(242, 241, 249, 1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(date.toString(), style: const TextStyle(fontSize: 12,),),
      ),
    );
  }

}