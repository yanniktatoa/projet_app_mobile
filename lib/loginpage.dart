import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:projet_iai/welcome_page.dart';
import '/log/theme_bloc.dart';
import '/log/login_design_theme.dart';
import '/log/values.dart';
import '/widgets/custom_button.dart';
import '/widgets/custom_driver.dart';
import '/widgets/custom_shape_clippers.dart';
import '/widgets/custom_text_formfiel.dart';
import '/widgets/space.dart';
import 'package:http/http.dart' as http;

class Loginpage extends StatefulWidget {
  Loginpage({required this.themeBloc});

  final ThemeBloc themeBloc;

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final heightOfAppBar = 56.0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    widget.themeBloc.selectedTheme.add(_buildLightTheme());
  }

  CurrentTheme _buildLightTheme() {
    return CurrentTheme('light', LoginDesign1Theme.lightThemeData);
  }

  Future<String> authenticateUser(String name, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.43.76:8000/api/login/'),
      body: jsonEncode({'name': name, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomePage(),
        ),
      );
      return data['token'];
    } else {
      throw Exception('Failed to authenticate user');
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height - heightOfAppBar;

    return Scaffold(
      appBar: AppBar(
        elevation: Sizes.ELEVATION_0,
        backgroundColor: AppColors.twitterBlue,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: CustomLoginShapeClipper2(),
                child: Container(
                  height: heightOfScreen,
                  decoration: BoxDecoration(color: AppColors.greyShade2),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: CustomLoginShapeClipper1(),
                child: Container(
                  height: heightOfScreen,
                  decoration: BoxDecoration(color: AppColors.twitterBlue),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_36),
              child: ListView(
                children: <Widget>[
                  //10% of the height of screen
                  SizedBox(height: heightOfScreen * 0.075),
                  _buildIntroText(context),
                  SpaceH8(),
                  _buildForm(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroText(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var heightOfScreen = MediaQuery.of(context).size.height - heightOfAppBar;

    return ListBody(
      children: <Widget>[
        Text(
          StringConst.WELCOME,
          style: textTheme.headline1!.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w900,
              fontSize: 50),
        ),
        SpaceH4(),
        Text(
          StringConst.BACK,
          style: textTheme.headline1?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w900,
              fontSize: 50),
        ),
        SpaceH4(),
        Text(
          StringConst.SIGN_IN_MSG,
          style: textTheme.subtitle2?.copyWith(
            color: AppColors.white,
            fontSize: Sizes.TEXT_SIZE_16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: heightOfScreen * 0.075),
        Text(
          StringConst.SIGN_IN,
          style: textTheme.headline1?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w900,
              fontSize: 50),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var iconTheme = Theme.of(context).iconTheme;

    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un mot de passe';
                }
                return null;
              },
              key: Key('username'),
              controller: _usernameController,
              hasPrefixIcon: true,
              textInputType: TextInputType.name,
              hintText: StringConst.NOM_UTILISATEUR,
              hintTextStyle: Styles.customTextStyle(color: AppColors.white),
              textStyle: Styles.customTextStyle(color: AppColors.white),
              prefixIcon: Icon(
                FeatherIcons.user,
                color: iconTheme.color,
                size: Sizes.ICON_SIZE_20,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            SpaceH20(),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un mot de passe';
                }
                return null;
              },
              key: Key('password'),
              controller: _passwordController,
              hasPrefixIcon: true,
              textInputType: TextInputType.text,
              hintTextStyle: Styles.customTextStyle(color: AppColors.white),
              textStyle: Styles.customTextStyle(color: AppColors.white),
              hintText: StringConst.MOT_DE_PASSE,
              obscured: true,
              prefixIcon: Icon(
                FeatherIcons.key,
                color: iconTheme.color,
                size: Sizes.ICON_SIZE_20,
              ),
            ),
            SpaceH24(),
            CustomButton(
                title: StringConst.SE_CONNECTER,
                textStyle: textTheme.button!.copyWith(
                  color: AppColors.white,
                ),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomePage(),
                      ));
                  if (_formKey.currentState!.validate()) {
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    try {
                      String token = await authenticateUser(username, password);
                    } catch (e) {
                      print(e.toString());
                    }
                  }
                }),
          ],
        ));
  }
}
