package com.kh.interactFunding.websocket.config;


import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

/**
 * 
 * Stomp
 * - MessageBroker방식 처리
 * - publish 발행/subscribe 구독 패턴 처리
 * 		- 특정url을 구독하는 subscriber에게 발행한 메세지를 전달
 *
 */
@Configuration
@EnableWebSocketMessageBroker
public class StompConfig implements WebSocketMessageBrokerConfigurer{

	/**
	 * client에서 최초 websocket 접속 url을 설정
	 */
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry
			.addEndpoint("/stomp");
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		//1.SimpleBroker 
		registry
			.enableSimpleBroker("/chat");
		
		//2.MessageHandler : /app/a --> @MessageMapping("/a")
		registry
			.setApplicationDestinationPrefixes("/funding");
	}

	
}
