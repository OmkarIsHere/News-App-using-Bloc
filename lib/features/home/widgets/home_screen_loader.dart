import 'package:flutter/material.dart';

class HomeScreenLoader extends StatelessWidget {
  final Size size;
  const HomeScreenLoader({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                isThreeLine: true,
                leading: Container(
                  height: 160,
                  width: 50,
                  color: Colors.grey.shade400,
                ),
                title:Container(
                  margin:const EdgeInsets.symmetric(vertical: 5),
                  height: 15,
                  width: size.width*0.5,
                  color: Colors.grey.shade400,
                ),
                subtitle:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                      width: size.width*0.6,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 15,
                      width: size.width*0.4,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            );
          },
      ),
    );
  }
}
