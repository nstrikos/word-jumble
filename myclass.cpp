#include "myclass.h"

MyClass::MyClass()
{
    m_xStart = 5;

   words[0] = "ΑΖΕΡΜΠΑΙΤΖΑΝ";
   words[1] = "ΑΓΓΛΙΑ";
   words[2] = "ΑΙΓΥΠΤΟΣ";
   words[3] = "ΑΙΘΙΟΠΙΑ";
   words[4] = "ΑΙΤΗ";
   words[5] = "ΑΛΒΑΝΙΑ";
   words[6] = "ΑΛΓΕΡΙΑ";
   words[7] = "ΑΝΓΚΟΛΑ";
   words[8] = "ΑΝΔΟΡΡΑ";
   words[9] = "ΑΡΓΕΝΤΙΝΗ";
   words[10] = "αρμενια";
   words[11] = "αυστραλια";
   words[12] = "αυστρια";
   words[13] = "αφγανισταν";
   words[14] = "βατικανο";
   words[15] = "βελγιο";
}

void MyClass::setXStart(double arg1)
{
    m_xStart = arg1;
}

double MyClass::xStart()
{
    return m_xStart;
}

QString MyClass::word()
{
    return m_word;
}

QString MyClass::jumble()
{
    srand(static_cast<unsigned int>(time(0)));
    int choice = (rand() % NUM_WORDS);
    QString theWord = words[choice];

    QString jumble = theWord;  // jumbled version of word
    int length = jumble.size();
    for (int i=0; i<length; ++i)
    {
        int index1 = (rand() % length);
        int index2 = (rand() % length);
        QChar temp = jumble[index1];
        jumble[index1] = jumble[index2];
        jumble[index2] = temp;
    }
    m_word = theWord;
    m_jumble = jumble;
    return m_jumble;
}
