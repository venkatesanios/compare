import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          'hello': 'Hello World',
          'message': 'Welcome to oro Irrigation ',
          'title': 'Flutter Language - Localization',
          'subscribe': 'Change Language click here',
          'changelang': 'Change Language',
          'title2': 'Second Page',
          'Next': 'Next',
          'Tamil': 'Tamil',
          'English': 'English',
          'Malayalam': 'Malayalam',
          'telugu': 'telugu',
          'kannada': 'kannada',
          'hindi': 'hindi',
        },
        //HINDI LANGUAGE
        'hi_IN': {
          'hello': 'नमस्ते दुनिया',
          'message': 'प्रोटो कोडर प्वाइंट में आपका स्वागत है',
          'title': 'स्पंदन भाषा - स्थानीयकरण',
          'subscribe': 'भाषा बदलें यहां क्लिक करें',
          'changelang': 'भाषा बदलो',
          'title2': 'दूसरा पेज',
          'Next': 'अगला',
          'hindi': 'हिंदी',
          'Tamil': 'तामिल',
          'English': 'अंग्रेज़ी',
          'Malayalam': 'मलयालम',
          'telugu': 'तेलुगु',
          'kannada': 'कन्नडा',
        },
        //KANNADA LANGUAGE
        'kn_IN': {
          'hello': 'ಹಲೋ ವರ್ಲ್ಡ್',
          'message': 'ಪ್ರೋಟೋ ಕೋಡರ್ ಪಾಯಿಂಟ್‌ಗೆ ಸುಸ್ವಾಗತ',
          'title': 'ಬೀಸು ಭಾಷೆ - ಸ್ಥಳೀಕರಣ',
          'subscribe': 'ಭಾಷೆಯನ್ನು ಬದಲಾಯಿಸಿ ಇಲ್ಲಿ ಕ್ಲಿಕ್ ಮಾಡಿ',
          'changelang': 'ಭಾಷೆ ಬದಲಿಸಿ',
          'title2': 'ಎರಡನೇ ಪುಟ',
          'Next': 'ಮುಂದೆ',
          'hindi': 'हिंदी',
          'Tamil': 'ತಮಿಳು',
          'English': 'ಆಂಗ್ಲ',
          'Malayalam': 'ಮಲಯಾಳಂ',
          'telugu': 'ತೆಲುಗು',
          'kannada': 'ಕನ್ನಡ',
        },
        //Tamil
        'ta_IN': {
          'hello': 'வணக்கம் ',
          'message': 'ஓரோ பாசனத்திற்கு வரவேற்கிறோம்',
          'title': 'மொழி - உள்ளூர்மயமாக்கல்',
          'subscribe': 'மொழியை மாற்ற இங்கே கிளிக் செய்யவும்',
          'changelang': 'மொழியை மாற்றவும்',
          'title2': 'இரண்டாவது பக்கம்',
          'Next': 'அடுத்து',
          'hindi': 'हिंदी',
          'Tamil': 'தமிழ்',
          'English': 'ஆங்கிலம்',
          'Malayalam': 'மலையாளம்',
          'telugu': 'தெலுங்கு',
          'kannada': 'கன்னடம்',
        }
      };
}
