import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:youapp_test/app/controllers/addinterest_controller.dart';
import 'package:youapp_test/app/controllers/loginscreen_controller.dart';
import 'package:youapp_test/app/ui/pages/addinterest_page/addinterest_page.dart';
import 'package:youapp_test/app/ui/pages/loginscreen_page/loginscreen_page.dart';
import '../../../controllers/profilescreen_controller.dart';

class ProfilescreenPage extends GetView<ProfilescreenController> {
  const ProfilescreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfilescreenController profilecontroller =
        Get.put(ProfilescreenController());

    final LoginScreenController logincontroller =
        Get.put(LoginScreenController());

    final AddinterestController addinterestController =
        Get.put(AddinterestController());

    var age = DateTime.now().year - controller.selectedDate.value.year;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(9, 20, 26, 1),
        ),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 81),
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Headers_Tab(logincontroller: logincontroller),
                const SizedBox(height: 60),
                Profile_Tab(
                  profilecontroller: profilecontroller,
                  logincontroller: logincontroller,
                  controller: controller,
                  age: age,
                ),
                const SizedBox(height: 24),
                Obx(() {
                  if (profilecontroller.isTapAbout.value == 0) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(14, 25, 31, 1),
                        border: Border.all(
                          color: const Color.fromRGBO(
                              14, 25, 31, 1), //color of border
                          width: 2, //width of border
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 16, left: 27),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "About",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      profilecontroller.isTapAbout.value = 1;
                                      print(profilecontroller.isTapAbout);
                                    },
                                    child: const Icon(
                                      Icons.edit_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                bottom: 23, left: 27, right: 57),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Add in your your to help others know you better",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.52),
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    if (profilecontroller.isTapAbout.value == 1) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(14, 25, 31, 1),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 16, left: 27),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "About",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      profilecontroller.isTapAbout.value = 2;
                                    },
                                    child: const Text(
                                      "Save & Update",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromRGBO(250, 250, 210, 0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 31, left: 27),
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.bottomSheet(
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(16.0),
                                                  topRight:
                                                      Radius.circular(16.0)),
                                            ),
                                            child: Wrap(
                                              alignment: WrapAlignment.end,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.end,
                                              children: [
                                                ListTile(
                                                  leading:
                                                      const Icon(Icons.camera),
                                                  title: const Text('Camera'),
                                                  onTap: () {
                                                    Get.back();
                                                    profilecontroller.getImage(
                                                        ImageSource.camera);
                                                    profilecontroller.addimage =
                                                        true.obs;
                                                  },
                                                ),
                                                ListTile(
                                                  leading:
                                                      const Icon(Icons.image),
                                                  title: const Text('Gallery'),
                                                  onTap: () {
                                                    Get.back();
                                                    profilecontroller.getImage(
                                                        ImageSource.gallery);
                                                    profilecontroller.addimage =
                                                        true.obs;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 57,
                                        height: 57,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              22, 35, 41, 1),
                                          border: Border.all(
                                            color: const Color.fromRGBO(22, 35,
                                                41, 1), //color of border
                                            width: 2, //width of border
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Obx(() =>
                                            profilecontroller.addimage.value
                                                ? Image.file(
                                                    profilecontroller
                                                        .selectedImagePath,
                                                    fit: BoxFit.cover,
                                                  )
                                                : const Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  )),
                                      )),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Add Image",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 29, left: 27, right: 14, bottom: 40),
                              child: Column(
                                children: [
                                  InputName(),
                                  const SizedBox(height: 12),
                                  InputGender(),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Birthday:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white.withOpacity(0.33),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          profilecontroller.chooseDate();
                                        },
                                        child: ConstrainedBox(
                                          constraints:
                                              const BoxConstraints.tightFor(
                                                  width: 202, height: 36),
                                          child: Container(
                                              alignment: Alignment.centerRight,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      217, 217, 217, 0.06),
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromRGBO(
                                                              255,
                                                              255,
                                                              255,
                                                              0.22)),
                                                  borderRadius:
                                                      BorderRadius.circular(9)),
                                              child: Obx(
                                                () => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: profilecontroller
                                                          .isTapCalender.value
                                                      ? Text(
                                                          "--",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.33),
                                                          ),
                                                        )
                                                      : Text(
                                                          DateFormat(
                                                                  "dd-MM-yyyy")
                                                              .format(
                                                                  profilecontroller
                                                                      .selectedDate
                                                                      .value)
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  InputZodiac(
                                    birthDate:
                                        profilecontroller.selectedDate.value,
                                    istapcalender:
                                        profilecontroller.isTapCalender,
                                  ),
                                  const SizedBox(height: 12),
                                  InputHoroscope(
                                    birthDate:
                                        profilecontroller.selectedDate.value,
                                    istapcalender:
                                        profilecontroller.isTapCalender,
                                  ),
                                  const SizedBox(height: 12),
                                  InputHeight(),
                                  const SizedBox(height: 12),
                                  InputWeight(),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      if (profilecontroller.isTapAbout.value == 2) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 219,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(14, 25, 31, 1),
                            border: Border.all(
                              color: const Color.fromRGBO(
                                  14, 25, 31, 1), //color of border
                              width: 2, //width of border
                            ),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, right: 16, left: 27),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "About",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          profilecontroller.isTapAbout.value =
                                              1;
                                        },
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 25, left: 27),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text("Birthday: ",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.52),
                                                fontSize: 14)),
                                        Text(
                                          "${DateFormat("dd / MM / yyyy").format(profilecontroller.selectedDate.value)} (Age $age)",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Horoscope: ",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.52),
                                                fontSize: 14)),
                                        Text(
                                          profilecontroller.horos.value,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Zodiac: ",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.52),
                                                fontSize: 14)),
                                        Text(
                                          profilecontroller.zodiac.value,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Height: ",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.52),
                                                fontSize: 14)),
                                        Text(
                                          profilecontroller.height.value,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Weight: ",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.52),
                                                fontSize: 14)),
                                        Text(
                                          profilecontroller.weight.value,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      throw {const Text("Error")};
                    }
                  }
                }),
                const SizedBox(height: 24),
                Interest_Tab(addinterestController: addinterestController),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class Headers_Tab extends StatelessWidget {
  const Headers_Tab({
    Key? key,
    required this.logincontroller,
  }) : super(key: key);

  final LoginScreenController logincontroller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: GestureDetector(
            onTap: () => Get.to(const LoginScreenPage()),
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Text(
          logincontroller.emailController.text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 26.76),
          child: Icon(
            Icons.more_horiz,
            color: Colors.white,
            size: 25,
          ),
        ),
      ],
    );
  }
}

class Profile_Tab extends StatelessWidget {
  const Profile_Tab({
    Key? key,
    required this.profilecontroller,
    required this.logincontroller,
    required this.controller,
    required this.age,
  }) : super(key: key);

  final ProfilescreenController profilecontroller;
  final LoginScreenController logincontroller;
  final ProfilescreenController controller;

  final int age;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profilecontroller.isTapProfile.value == 0) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 190,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(22, 35, 41, 1),
            border: Border.all(
              color: const Color.fromRGBO(22, 35, 41, 1), //color of border
              width: 2, //width of border
            ),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 17, left: 13),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                logincontroller.emailController.text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        );
      } else if (profilecontroller.isTapProfile.value == 1) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 190,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: FileImage(profilecontroller.selectedImagePath)),
            color: const Color.fromRGBO(22, 35, 41, 1),
            border: Border.all(
              color: const Color.fromRGBO(22, 35, 41, 1), //color of border
              width: 2, //width of border
            ),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 87, left: 13),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Obx(() {
                    if (controller.name.value.isEmpty) {
                      return const Text(
                        "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      );
                    } else {
                      return Text(
                        controller.name.value + ', ' + (age).toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      );
                    }
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 12, left: 13),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      if (profilecontroller.isTapGender.value == 0) {
                        return const Text("",
                            style:
                                TextStyle(color: Colors.white, fontSize: 13));
                      } else {
                        return Text(controller.Gender,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13));
                      }
                    })),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(31, 35, 31, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(
                                31, 35, 31, 1), //color of border
                            width: 2, //width of border
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 97,
                        height: 36,
                        child: Center(
                          child: Text(
                            controller.zodiac.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(31, 35, 31, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(
                                31, 35, 31, 1), //color of border
                            width: 2, //width of border
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 97,
                        height: 36,
                        child: Center(
                          child: Text(
                            controller.horos.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
      throw {const Text("Error")};
    });
  }
}

class Interest_Tab extends StatelessWidget {
  const Interest_Tab({
    Key? key,
    required this.addinterestController,
  }) : super(key: key);

  final AddinterestController addinterestController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(14, 25, 31, 1),
        border: Border.all(
          color: const Color.fromRGBO(14, 25, 31, 1), //color of border
          width: 2, //width of border
        ),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 16, left: 27, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Interest",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(AddinterestPage()),
                    child: const Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            if (addinterestController.savedValues.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 23, left: 27, right: 57),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Add in your your to help others know you better",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.52),
                        fontSize: 14),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 23, left: 27, right: 57),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 12, // define the spacing between items
                    runSpacing: 12, // define the spacing between rows
                    children: List.generate(
                      addinterestController.savedValues.length,
                      (index) {
                        final value = addinterestController.savedValues[index];
                        return Container(
                          height: 31,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }
          })
        ],
      ),
    );
  }
}

class InputZodiac extends StatelessWidget {
  final DateTime birthDate;
  final RxBool istapcalender;
  InputZodiac({
    Key? key,
    required this.birthDate,
    required this.istapcalender,
  }) : super(key: key);

  final _controller = Get.put(ProfilescreenController());

  @override
  Widget build(BuildContext context) {
    final zodiac = getZodiac(birthDate.month, birthDate.day);
    _controller.zodiac.value = zodiac;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Horoscope:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.white.withOpacity(0.33),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 202, height: 36),
          child: Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 0.06),
                border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 0.22)),
                borderRadius: BorderRadius.circular(9)),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Obx(
                () => Text(
                  istapcalender.value ? "--" : zodiac,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getZodiac(int month, int day) {
    print("aa");
    switch (month) {
      case 1:
        return day < 20 ? 'Capricorn' : 'Aquarius';
      case 2:
        return day < 19 ? 'Aquarius' : 'Pisces';
      case 3:
        return day < 21 ? 'Pisces' : 'Aries';
      case 4:
        return day < 20 ? 'Aries' : 'Taurus';
      case 5:
        return day < 21 ? 'Taurus' : 'Gemini';
      case 6:
        return day < 21 ? 'Gemini' : 'Cancer';
      case 7:
        return day < 23 ? 'Cancer' : 'Leo';
      case 8:
        return day < 23 ? 'Leo' : 'Virgo';
      case 9:
        return day < 23 ? 'Virgo' : 'Libra';
      case 10:
        return day < 23 ? 'Libra' : 'Scorpio';
      case 11:
        return day < 22 ? 'Scorpio' : 'Sagittarius';
      case 12:
        return day < 22 ? 'Sagittarius' : 'Capricorn';
      default:
        return '';
    }
  }
}

class InputHoroscope extends StatelessWidget {
  final DateTime birthDate;
  final RxBool istapcalender;
  InputHoroscope({
    Key? key,
    required this.birthDate,
    required this.istapcalender,
  }) : super(key: key);

  final _controller = Get.put(ProfilescreenController());

  @override
  Widget build(BuildContext context) {
    final zodiac = _calculateZodiac(birthDate.year);
    _controller.horos.value = zodiac;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Zodiac:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.white.withOpacity(0.33),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 202, height: 36),
          child: Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 0.06),
                border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 0.22)),
                borderRadius: BorderRadius.circular(9)),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Obx(
                () => Text(
                  istapcalender.value ? "--" : zodiac,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _calculateZodiac(int year) {
    const zodiacList = [
      'Monkey',
      'Rooster',
      'Dog',
      'Pig',
      'Rat',
      'Ox',
      'Tiger',
      'Rabbit',
      'Dragon',
      'Snake',
      'Horse',
      'Sheep'
    ];
    print(year);
    return zodiacList[(year - 1924) % 12];
  }
}

class InputGender extends StatelessWidget {
  InputGender({
    Key? key,
  }) : super(key: key);

  final ProfilescreenController profilecontroller =
      Get.put(ProfilescreenController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Gender:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.white.withOpacity(0.33),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 202, height: 36),
          child: Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 0.06),
                border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 0.22)),
                borderRadius: BorderRadius.circular(9)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  hint: Text(
                    "Select Gender",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.33), fontSize: 13),
                    textAlign: TextAlign.right,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  value: profilecontroller.selectedValue,
                  onChanged: (newValue) {
                    profilecontroller.onSelected(newValue!);
                  },
                  elevation: 10,
                  dropdownColor: const Color.fromRGBO(14, 25, 31, 1),

                  // ignore: prefer_const_literals_to_create_immutables
                  items: [
                    const DropdownMenuItem(
                      // ignore: sort_child_properties_last
                      child: SizedBox(
                        width: 70,
                        child: Text(
                          "Male",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      value: 'Male',
                    ),
                    const DropdownMenuItem(
                      // ignore: sort_child_properties_last
                      child: SizedBox(
                        width: 70,
                        child: Text(
                          "Female",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      value: 'Female',
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}

class InputName extends StatelessWidget {
  InputName({
    Key? key,
  }) : super(key: key);

  final _txtController = TextEditingController();
  final _controller = Get.put(ProfilescreenController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Display name:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.white.withOpacity(0.33),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 202, height: 36),
          child: TextFormField(
            textAlign: TextAlign.right,
            textAlignVertical: TextAlignVertical.center,
            controller: _txtController..text = _controller.name.value,
            onChanged: (value) => _controller.name.value = value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(255, 255, 255, 0.22),
                ),
                borderRadius: BorderRadius.circular(9),
              ),
              filled: true,
              fillColor: const Color.fromRGBO(217, 217, 217, 0.06),
              hintText: ("Enter name"),
              hintStyle: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.3), fontSize: 13),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class InputHeight extends StatelessWidget {
  InputHeight({
    Key? key,
  }) : super(key: key);

  final _txtController = TextEditingController();
  final _controller = Get.put(ProfilescreenController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Height:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.white.withOpacity(0.33),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 202, height: 36),
          child: TextFormField(
            keyboardType: TextInputType.number,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.right,
            controller: _txtController..text = _controller.height.value,
            onChanged: (value) => _controller.height.value = value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(255, 255, 255, 0.22),
                ),
                borderRadius: BorderRadius.circular(9),
              ),
              filled: true,
              fillColor: const Color.fromRGBO(217, 217, 217, 0.06),
              hintText: ("Add height"),
              hintStyle: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.3), fontSize: 13),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class InputWeight extends StatelessWidget {
  InputWeight({
    Key? key,
  }) : super(key: key);

  final _txtController = TextEditingController();
  final _controller = Get.put(ProfilescreenController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Weight:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.white.withOpacity(0.33),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 202, height: 36),
          child: TextFormField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
            textAlignVertical: TextAlignVertical.center,
            controller: _txtController..text = _controller.weight.value,
            onChanged: (value) => _controller.weight.value = value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(255, 255, 255, 0.22),
                ),
                borderRadius: BorderRadius.circular(9),
              ),
              filled: true,
              fillColor: const Color.fromRGBO(217, 217, 217, 0.06),
              hintText: ("Add weight"),
              hintStyle: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.3), fontSize: 13),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
