package cn.acyou.cancer.ws;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


/**
 * WebSocket 聊天室
 */
@ServerEndpoint("/websocket/{sid}")
@Component
@Slf4j
public class ChartRoomServer {

    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;
    //concurrent包的线程安全MAP，用来存放每个客户端对应的WebSocket对象。
    private static Map<String, ChartRoomServer> currentMemberMap = new ConcurrentHashMap<>();

    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    //接收sid
    private String sid = "";

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("sid") String sid) {
        this.session = session;
        currentMemberMap.put(sid, this);     //加入set中
        addOnlineCount();                   //在线数加1
        log.info("有新窗口开始监听:" + sid + ",当前在线人数为" + getOnlineCount());
        this.sid = sid;
        sendMessage("恭喜你，连接成功！当前在线" + getOnlineCount() + "人，一起来聊天吧！");

    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        currentMemberMap.remove(this.sid);
        subOnlineCount();           //在线数减1
        log.info("用户" + this.sid + "连接关闭！当前在线人数为" + getOnlineCount());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("收到来自窗口" + sid + "的信息:" + message);
        currentMemberMap.get(sid).sendMessage("服务器收到了您的消息：" + message);
        //系统消息
        boolean isSystemMessage = systemCommand(message);
        if (isSystemMessage) {
            return;
        }
        String[] allMessage = message.split(":");
        //聊天室聊天
        if (allMessage.length == 1) {
            sendEveryOneMessageWithoutMe("收到来自" + this.sid + "的消息：" +allMessage[0]);
        }
        //私聊
        if (allMessage.length == 2) {
            String id = allMessage[0];
            String mess = allMessage[1];
            sendInfo("收到来自" + id + "的消息：" + mess, id);
        }

    }

    private boolean systemCommand(String message) {
        if ("list".equals(message)) {
            String allMember = StringUtils.join(currentMemberMap.keySet(), ",");
            sendMessage("当前所有用户：" + allMember);
            return true;
        }
        return false;
    }

    /**
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发生错误");
        error.printStackTrace();
    }

    /**
     * 实现服务器主动推送
     */
    public void sendMessage(String message) {
        try {
            this.session.getBasicRemote().sendText(message);
        } catch (IOException e) {
            e.printStackTrace();
            log.error("websocket IO异常");
        }
    }

    /**
     * 群发自定义消息
     */
    public static void sendEveryOneMessage(String message) {
        currentMemberMap.values().forEach(x -> {
            x.sendMessage(message);
        });
    }

    /**
     * 给除了自己发送消息
     */
    public void sendEveryOneMessageWithoutMe(String message) {
        currentMemberMap.values().forEach(x -> {
            if (!x.sid.equals(this.sid)) {
                x.sendMessage(message);
            }
        });
    }


    /**
     * 群发自定义消息
     */
    public void sendInfo(String message, @PathParam("sid") String sid) {
        log.info("推送消息到窗口" + sid + "，推送内容:" + message);
        if (sid == null) {
            sendEveryOneMessage(message);
        } else {
            ChartRoomServer chartRoomServer = currentMemberMap.get(sid);
            if (chartRoomServer == null) {
                this.sendMessage("没有找到对应的用户！");
            } else {
                chartRoomServer.sendMessage(message);
            }
        }
    }

    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        ChartRoomServer.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        ChartRoomServer.onlineCount--;
    }
}