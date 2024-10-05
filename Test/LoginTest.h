#ifndef LOGINTEST_H
#define LOGINTEST_H

#include <QObject>
#include <Login.h>
#include <QtTest/QtTest>

class LoginTest : public QObject
{
    Q_OBJECT
public:
    LoginTest(QObject *parent = nullptr);

private slots:
    void initTestCase();    // Called before all tests
    void cleanupTestCase(); // Called after all tests
    void testValidLogin();
    void testInvalidLogin();
};

#endif // LOGINTEST_H
