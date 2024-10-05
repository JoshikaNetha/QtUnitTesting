#include "LoginTest.h"

LoginTest::LoginTest(QObject *parent)
    : QObject{parent}
{}

void LoginTest::initTestCase()
{

}

void LoginTest::cleanupTestCase()
{

}

void LoginTest::testValidLogin()
{
    Login login;
    QString username = "Admin";
    QString password = "a";
    QVERIFY(login.authenticate(username, password));
}

void LoginTest::testInvalidLogin()
{
    Login login;
    QString username = "invalidUser";
    QString password = "invalidPassword";
    QVERIFY(!login.authenticate(username, password));

    // Test invalid username
    QCOMPARE(login.authenticate("wronguser", "admin123"), false);
    // Test invalid password
    QCOMPARE(login.authenticate("admin", "wrongpassword"), false);
    // Test both username and password incorrect
    QCOMPARE(login.authenticate("wronguser", "wrongpassword"), false);
}
