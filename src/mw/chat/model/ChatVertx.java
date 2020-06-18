package mw.chat.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.vertx.java.core.Handler;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;

import com.nhncorp.mods.socket.io.SocketIOServer;
import com.nhncorp.mods.socket.io.SocketIOSocket;
import com.nhncorp.mods.socket.io.impl.DefaultSocketIOServer;
import com.nhncorp.mods.socket.io.spring.DefaultEmbeddableVerticle;

import mw.moneyio.model.MoneyioDAO;
import mw.moneyio.model.MoneyioDTO;

public class ChatVertx extends DefaultEmbeddableVerticle {
	private static SocketIOServer io = null;
	
	@Autowired
	private MoneyioDAO dao = null;
	
	public List list = new ArrayList();
	
	@Override
	public void start(Vertx vertx) {
		int port = 12345;
		
		HttpServer server = vertx.createHttpServer();
		
		io = new DefaultSocketIOServer(vertx, server);
		
		io.sockets().onConnection(new Handler<SocketIOSocket>() {
			public void handle(final SocketIOSocket socket) {
				
				socket.on("msg", new Handler<JsonObject>() {	// 요청(채팅실행)될 때마다 실행
					public void handle(JsonObject event) {

						String id = "minmingk1";
						/* String id = session.getAttribute("memId"); */
						list = dao.moneyioListAll(id);
				
						String userMsg = "";
						userMsg = event.getString("msg"); 	// 회원이 보낸 채팅메시지
						
						
						
						// 키워드 처리 // 답 메시지 저장	// HashMap(?)
						if(userMsg.contains("안녕") || userMsg.contains("하이")) {
							
							event.putString("adminRe", "그래, 안녕");
							
						}else if(userMsg.contains("잘가") || userMsg.contains("바이") || userMsg.contains("갈게")) {
							
							event.putString("adminRe", "그래, 잘가");
							
						}else if((userMsg.contains("id") || userMsg.contains("아이디")) && userMsg.contains("찾아")) {
							
							event.putString("adminRe", "회원님의 아이디는 ### 입니다.");		
							
						}else if((userMsg.contains("현재") || userMsg.contains("지금")) && 
								(userMsg.contains("남아있는") || userMsg.contains("남은")) && userMsg.contains("잔액")) {
							
							
							event.putString("adminRe", "회원님의 현재 남은 잔액은 " + /* list[0].io_remain  + */ "원 입니다.");		
							
						}else {
							
							event.putString("adminRe", "다시 입력해주세요.");
							
						}
						


						System.out.println("handler ::: " + event.getString("msg"));
						System.out.println("handler ::: " + event.getString("adminRe"));

						io.sockets().emit("response", event);
						
						
						
						
						
						
						
						
						
						
									// 채팅내용 보내기 (main.jsp의 socket.on("response", )으로)
						/*
						 * io.sockets().emit("test", event); // html()을 활용하여 특정 위치에 내용을 고정시킨다
						 */					}
				});
				
			}
		});
		
		server.listen(port);		// 서버 실행
	}
	
}
