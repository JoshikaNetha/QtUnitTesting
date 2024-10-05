#include "Login.h"
#include <QDebug>
Login::Login(QObject *parent)
    : QObject{parent}
{}

bool Login::authenticate(QString username, QString password)
{
    if(username == "Admin" && password == "a"){
        return true;
    }
    return false;
}
