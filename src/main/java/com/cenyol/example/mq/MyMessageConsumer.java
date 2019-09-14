package com.cenyol.example.mq;

//import org.apache.activemq.ActiveMQConnectionFactory;

//import javax.jms.*;

import org.apache.activemq.ActiveMQConnectionFactory;

import javax.jms.*;

/**
 * Created by HUANG at 2019/8/19
 */
public class MyMessageConsumer {

    private static final String ACTIVEMQ_URL = "tcp://127.0.0.1:61616";

    private static final String QUEUE_NAME = "MyMessageQueue";

    public static void main(String[] args) throws JMSException {

        ActiveMQConnectionFactory activeMQConnectionFactory = new ActiveMQConnectionFactory(ACTIVEMQ_URL);

        Connection connection = activeMQConnectionFactory.createConnection();

        connection.start();

        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);

        Destination destination = session.createQueue(QUEUE_NAME);

        MessageConsumer consumer = session.createConsumer(destination);

        consumer.setMessageListener(new MessageListener() {
            public void onMessage(Message message) {
                TextMessage textMessage = (TextMessage) message;
                try {
                    System.out.println("获取消息： " + textMessage.getText());
                } catch (JMSException e) {
                    e.printStackTrace();
                }
            }
        });

    }
}
