package cn.acyou.cancer.mq;

import cn.acyou.cancer.ws.WebSocketServer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * 消息消费者
 * @author youfang
 * @version [1.0.0, 2018-08-04 下午 11:16]
 **/
@Slf4j
@Component
public class OrderReceiver {

    @RabbitHandler//process方法是用来处理接收到的消息的，我们这里收到消息后直接打印即可。
    @RabbitListener(queues = "order", containerFactory="rabbitListenerContainerFactory")
    public void process(String message) {
        System.out.println("RabbitMQ ————————————> Receiver : " + message);
        WebSocketServer.sendInfo("every one ： " + message, null);
    }
}