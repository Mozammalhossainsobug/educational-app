import 'package:education_app/core/utils/colors.dart';
import 'package:education_app/core/widgets/input_form_field.dart';
import 'package:education_app/feature/dashboard/domain/entities/course_entity.dart';
import 'package:education_app/feature/dashboard/presentation/widgets/introduction_widget.dart';
import 'package:education_app/feature/dashboard/presentation/widgets/offer_card_widget.dart';
import 'package:education_app/feature/dashboard/presentation/widgets/user_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key, required this.courses});
  final List<CourseEntity> courses;
  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  TextEditingController searchKey = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Column(
            children: [
              SizedBox(height: size.height * .1),
              const IntroductionWidget(),
              SizedBox(height: size.height * .05),
              InputFormField(
                textEditingController: searchKey,
                hintText: "Search for..",
                hintTextStyle: const TextStyle(color: Colors.grey),
                fillColor: Colors.black12,
                borderType: BorderType.outlined,
                bottomMargin: 10,
                prefix: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
                suffix: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: UIColors.branda,
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.tune,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(height: size.height * .03),
              const OfferCardWidget(),
              SizedBox(height: size.height * .03),
              UserCourses(userCourse: widget.courses),
            ],
          ),
        ),
      ),
    );
  }
}
