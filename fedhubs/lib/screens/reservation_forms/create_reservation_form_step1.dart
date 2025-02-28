import 'package:fedhubs_pro/widgets/send_client_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../foundation/constants.dart';
import '../../widgets/buttons/custom_flat_button.dart';
import '../../widgets/forms/custom_form_field_icon.dart';

class CreateReservationFormStep1 extends StatefulWidget {
  const CreateReservationFormStep1({Key? key}) : super(key: key);

  @override
  State<CreateReservationFormStep1> createState() =>
      _CreateReservationFormStep1State();
}

class _CreateReservationFormStep1State
    extends State<CreateReservationFormStep1> {
  @override
  Widget build(BuildContext context) {
    Size realScreenSize = MediaQuery.of(context).size;
    Size screenSize =
        Size(kIsWeb ? 600 : realScreenSize.width, realScreenSize.height);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, screenSize.height * 0.09, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: Stack(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Theme.of(context).primaryColorDark,
                          size: 40,
                        ),
                        const Positioned(
                          left: 14,
                          bottom: 10,
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'Créer une réservation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Text(
                    'Informations',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomFormFieldIcon(
                label: "Prénom",
                onSaved: (onsaved) {},
                icon: const Icon(Icons.person_outline),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomFormFieldIcon(
                label: "Nom",
                onSaved: (onsaved) {},
                icon: const Icon(Icons.person_outline),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomFormFieldIcon(
                label: "Téléphone",
                onSaved: (onsaved) {},
                icon: const Icon(Icons.mail_outline),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomFormFieldIcon(
                label: "Mail",
                onSaved: (onsaved) {},
                icon: const Icon(Icons.mail_outline),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: const [
                  Icon(Icons.send_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText:
                              'Ajouter un message personnalisée pour votre client...',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          )),
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              CustomFormFieldIcon(
                label: "Date",
                onSaved: (onsaved) {},
                icon: const Icon(Icons.date_range_outlined),
              ),
              const SizedBox(
                height: 8,
              ),
              _buildTimePicker(),
              const SizedBox(
                height: 10,
              ),
              CustomFormFieldIcon(
                label: "Nb pers",
                icon: const Icon(Icons.person_outline),
                onSaved: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              SendClientNotificationSwitch(),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CustomFlatButton(
                  width: realScreenSize.width,
                  text: "Suivant",
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimePicker() {
    final hourtextcontroller = TextEditingController();

    return Row(
      children: [
        const Icon(Icons.schedule),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            // style: TextStyle(),
            keyboardType: TextInputType.none,
            controller: hourtextcontroller,
            decoration: const InputDecoration(
              labelText: 'Horaire',
            ),
            onTap: () async {
              showTimePicker(context: context, initialTime: TimeOfDay.now());
              hourtextcontroller.text = TimeOfDay.now().toString();
              //à changer
            },
          ),
        ),
      ],
    );
  }
}
