#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>

class Login : public QObject
{
    Q_OBJECT
public:
    Login(QObject *parent = nullptr);
    Q_INVOKABLE bool authenticate(QString username,QString password);

signals:
};

#endif // LOGIN_H
