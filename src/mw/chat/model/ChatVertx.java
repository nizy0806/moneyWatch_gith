package mw.chat.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import mw.member.model.MemberDAO;
import mw.member.model.MemberDTO;
import mw.moneyio.model.MoneyioDAO;
import mw.moneyio.model.MoneyioDTO;

public class ChatVertx extends DefaultEmbeddableVerticle {
	private static SocketIOServer io = null;
	
	
	SimpleDateFormat formatTime = new SimpleDateFormat("HH:mm:ss");
	
	
	// moneyioDAO, DTO, List 생성(호출)
	@Autowired
	private MoneyioDAO moDAO = null;
	private MoneyioDTO moDTO = new MoneyioDTO();
	public List moAllList = new ArrayList();		// 모든 내역 목록 저장
	public List moReList = new ArrayList();			// 일자별 마지막 내역 저장

	int remainAgo_1;
	int remainAgo_2;
	int before_remain;
	
	// memberDAO, DTO, List 생성(호출)
	@Autowired
	private MemberDAO meDAO = null;
	private MemberDTO meDTO = new MemberDTO();
	public List meAllList = new ArrayList();
	
	
	@Override
	public void start(Vertx vertx) {
		int port = 12345;
		
		HttpServer server = vertx.createHttpServer();
		
		io = new DefaultSocketIOServer(vertx, server);
		
		io.sockets().onConnection(new Handler<SocketIOSocket>() {
			public void handle(final SocketIOSocket socket) {
				
				socket.on("msg", new Handler<JsonObject>() {	// 요청(채팅실행)될 때마다 실행
					public void handle(JsonObject event) {
						Date time = new Date();									//////// new 객체가 계속 생성되어도 괜찮은건가???????
						
						String nowTime = formatTime.format(time);
						
						event.putString("nowTime", nowTime);
						
						
						System.out.println("id : " + event.getString("id"));
						
						String id = event.getString("id");
						
						moAllList = moDAO.moneyioListAll(id);	// 메시지 보낸 사용자에 대한 입출력내역 목록 가져오기
						moReList = moDAO.moneyioListRemain(id);	// 메시지 보낸 사용자에 대한 입출력내역의 일자별 마지막 내역 가져오기
						
						meDTO = meDAO.modifyCheck(id);			// 메시지 보낸 사용자에 대한 회원정보 가져오기
						
						System.out.println("id2 : " + meDTO.getId());
						
						String userMsg = "";
						userMsg = event.getString("msg"); 	// 회원이 보낸 채팅메시지
						
						
						
						
						
						
						
// callback Method 사용? (파라미터: userMsg, id, meDTO, moAllList .. 등 // 반환값: adminRe)
// ########################################################################################################
// 키워드 처리 // 답 메시지 저장	// Key,Value
						if(userMsg.contains("안녕") || userMsg.contains("하이") || userMsg.contains("ㅎㅇ")) {
			// 인사(1)
							event.putString("adminRe", "그래, 안녕");
							
						}else if(userMsg.contains("잘가") || userMsg.contains("바이")
								|| userMsg.contains("갈게") || userMsg.contains("ㅂㅇ")) {
			// 인사(2)
							event.putString("adminRe", "그래, 잘가");
							
						}else if((userMsg.contains("ID") || userMsg.contains("id") || userMsg.contains("아이디"))
								&& userMsg.contains("찾아") || userMsg.contains("뭐야")) {
			// 회원 ID 알림
							event.putString("adminRe", "회원님의 아이디는 [ "+ id + " ] 입니다.");		
							
						}else if((userMsg.contains("현재") || userMsg.contains("지금")) ||
								(userMsg.contains("남아있") || userMsg.contains("남은") || userMsg.contains("있어")) && 
								(userMsg.contains("잔액") || userMsg.contains("금액") || 
										userMsg.contains("얼마") || userMsg.contains("돈")) ) {
			// 남은 잔액 알림							
							moDTO = (MoneyioDTO)moAllList.get(0);		// 가장 최근 내역
							event.putString("adminRe", id + " 님의 현재 남은 잔액은 " + moDTO.getIo_remain()  + "원 입니다.");		
							
						}else if((userMsg.contains("어제") || userMsg.contains("전날")
								 || userMsg.contains("하루 전") || userMsg.contains("1일 전")) &&
								(userMsg.contains("사용") || userMsg.contains("소비") || userMsg.contains("썻") ||
									userMsg.contains("쓴") || userMsg.contains("썼") || userMsg.contains("지출")) && 
								(userMsg.contains("잔액") || userMsg.contains("금액") || userMsg.contains("얼마")
									|| userMsg.contains("돈")) ) {
			// 어제(전날) 지출 금액 알림	
							moDTO = (MoneyioDTO)moReList.get(1);		// 1일 전 마지막 내역 저장
							remainAgo_1 = moDTO.getIo_remain();		// 1일 전 남은 잔액
							moDTO = (MoneyioDTO)moReList.get(2);		// 2일 전 마지막 내역 저장
							remainAgo_2 = moDTO.getIo_remain();		// 2일 전 남은 잔액
							
							before_remain = remainAgo_2 - remainAgo_1;	// 1일 전에 지출한 잔액
							
							event.putString("adminRe", id + " 님은 어제 사용하신 금액 " + before_remain  + "원 입니다.");		
							
						}else if((userMsg.contains("그제") || userMsg.contains("이튿날")
								 || userMsg.contains("그저께") || userMsg.contains("2일 전")) &&
								(userMsg.contains("사용") || userMsg.contains("소비") || userMsg.contains("썻") ||
									userMsg.contains("쓴") || userMsg.contains("썼") || userMsg.contains("지출")) && 
								(userMsg.contains("잔액") || userMsg.contains("금액") || userMsg.contains("얼마")
									|| userMsg.contains("돈")) ) {
			// 그제(이튿날) 지출 금액 알림	
							moDTO = (MoneyioDTO)moReList.get(2);		// 1일 전 마지막 내역 저장
							remainAgo_1 = moDTO.getIo_remain();		// 1일 전 남은 잔액
							moDTO = (MoneyioDTO)moReList.get(3);		// 2일 전 마지막 내역 저장
							remainAgo_2 = moDTO.getIo_remain();		// 2일 전 남은 잔액
							
							before_remain = remainAgo_2 - remainAgo_1;	// 1일 전에 지출한 잔액
							
							event.putString("adminRe", id + " 님은 어제 사용하신 금액 " + before_remain  + "원 입니다.");		
							
						}else{
			// 키워드 조건에 해당되지 않는 질문에 대한 답		
							event.putString("adminRe", "다시 입력해주세요.");
							
						}
// ########################################################################################################
						
						System.out.println("handler ::: " + event.getString("msg"));
						System.out.println("handler ::: " + event.getString("adminRe"));

						io.sockets().emit("response", event);
 
					}
				});
				
			}
		});
		
		server.listen(port);		// 서버 실행
	}
	
}
