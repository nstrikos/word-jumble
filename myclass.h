#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>
#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>

using namespace std;


class MyClass : public QObject
{
    Q_OBJECT

public:
    MyClass();


    void setXStart(double arg1);
    double xStart();
    QString word();
    QString jumble();

    Q_PROPERTY(double xStart READ xStart WRITE setXStart)
    Q_PROPERTY(QString word READ word)
    Q_PROPERTY(QString jumble READ jumble)




private:
    double m_xStart;
    const int NUM_WORDS = 16;
    QString words[16];
    QString m_word;
    QString m_jumble;
};

#endif // MYCLASS_H
