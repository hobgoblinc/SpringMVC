package com.huang.server.mq;

//import org.apache.activemq.ActiveMQConnectionFactory;

//import javax.jms.*;

import org.apache.activemq.ActiveMQConnectionFactory;

import javax.jms.*;

/**
 * Created by HUANG at 2019/8/19
 */
public class MyMessageProducer {

    private static final String ACTIVEMQ_URL = "tcp://127.0.0.1:61616";

    private static final String QUEUE_NAME = "MyMessageQueue";

    public static void main(String[] args) throws JMSException {

        ActiveMQConnectionFactory activeMQConnectionFactory = new ActiveMQConnectionFactory(ACTIVEMQ_URL);

        Connection connection = activeMQConnectionFactory.createConnection();

        connection.start();

        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);

        Destination destination = session.createQueue(QUEUE_NAME);

        MessageProducer producer = session.createProducer(destination);

        for (int i = 0; i < 100; i++) {
            TextMessage message = session.createTextMessage("我发送message： " + i);

            producer.send(message);

            System.out.println("我发送的消息是： " + message.getText());
        }

        connection.close();
    }
}
