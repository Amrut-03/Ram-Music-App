class History {
  String title;
  String description;

  History({required this.title, required this.description});
}

class historyList {
  static List<History> historyData = [
    History(
      title: 'Ancient Period',
      description:
          ' Hindus believe Lord Rama, a revered deity, was born in Ayodhya'
          '3rd century BC - 12th century AD: Archaeological evidence suggests structures existed at the disputed site.',
    ),
    History(
      title: 'Mughal Period',
      description:
          '1528: Babur, a Mughal emperor, builds the Babri Masjid at the site. Reasons remain unclear but could be religious or political.',
    ),
    History(
      title: '19th-20th Centuries',
      description:
          '1885: First legal suit filed by Hindus claiming ownership of the site.'
          '1949: Idols of Rama placed inside the Babri Masjid, leading to communal tensions.'
          '1992: December 6th: Hindu activists demolish the Babri Masjid, triggering nationwide violence and riots.',
    ),
    History(
      title: 'Legal Battles and Resolution',
      description:
          '1992-2019: Decades of legal battles with various parties claiming ownership.'
          '2019: November 9th: Supreme Court of India awards disputed land to Hindus for building a Ram Mandir. Separate land allocated for a mosque.',
    ),
    History(
      title: 'Current Status',
      description:
          '2020-Present: Construction of the Ram Mandir is ongoing, attracting significant investment and holding religious significance for Hindus.'
          'The disputes legacy continues to influence social and political dynamics in India.',
    ),
  ];
}
