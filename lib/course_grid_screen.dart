import 'package:flutter/material.dart';

class CourseGridScreen extends StatelessWidget {
  const CourseGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      {
        'image':
            'https://cdn.ostad.app/course/cover/2024-12-17T11-35-19.890Z-Course%20Thumbnail%2012.jpg',
        'title': 'Full Stack Web Development with JavaScript (MERN)',
        'batch': 'ব্যাচ ১১',
        'seat': '৬ সিট বাকি',
        'days': '৬ দিন বাকি',
      },
      {
        'image':
            'https://cdn.ostad.app/course/cover/2024-12-19T15-48-52.487Z-Full-Stack-Web-Development-with-Python,-Django-&-React.jpg',
        'title': 'Full Stack Web Development with Python, Django & React',
        'batch': 'ব্যাচ ৬',
        'seat': '৮৬ সিট বাকি',
        'days': '৪০ দিন বাকি',
      },
      {
        'image':
            'https://cdn.ostad.app/course/cover/2024-12-18T15-29-34.261Z-Untitled-1%20(23).jpg',
        'title': 'Full Stack Web Development with ASP.Net Core',
        'batch': 'ব্যাচ ৭',
        'seat': '৭৫ সিট বাকি',
        'days': '৩৯ দিন বাকি',
      },
      {
        'image':
            'https://cdn.ostad.app/course/cover/2024-12-18T15-24-44.114Z-Untitled-1%20(21).jpg',
        'title': 'SQA: Manual & Automated Testing',
        'batch': 'ব্যাচ ১৩',
        'seat': '৬৫ সিট বাকি',
        'days': '৪১ দিন বাকি',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Courses'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.48,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return CourseCard(
              image: course['image']!,
              title: course['title']!,
              batch: course['batch']!,
              seat: course['seat']!,
              days: course['days']!,
            );
          },
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String image;
  final String title;
  final String batch;
  final String seat;
  final String days;

  const CourseCard({
    super.key,
    required this.image,
    required this.title,
    required this.batch,
    required this.seat,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(image, height: 100, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    InfoTag(text: batch),
                    InfoTag(text: seat),
                    InfoTag(text: days),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'বিস্তারিত দেখি',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  Icon(Icons.arrow_forward, size: 14, color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoTag extends StatelessWidget {
  final String text;
  const InfoTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: const TextStyle(fontSize: 11)),
    );
  }
}
