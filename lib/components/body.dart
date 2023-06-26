import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/components/progress_bar.dart';
import 'package:quiz_app/components/question_card.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import '../constants.dart';
import 'background_design.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // for controller accessibility
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        // Todo change to svg background
        const BackGroundDesign(),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                    () => Text.rich(
                      TextSpan(
                        text: "Question ${_questionController.questionNumber}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: kSecondaryColor),
                        children: [
                          TextSpan(
                            text: "/${_questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: kSecondaryColor),
                          ),
                        ],
                      ),
                    ),
                ),
              ),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: PageView.builder(
                  // block swipe to next question
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateQuestionNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(question: _questionController.questions[index],),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
