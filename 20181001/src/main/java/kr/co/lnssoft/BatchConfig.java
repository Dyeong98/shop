package kr.co.lnssoft;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration
@EnableScheduling
public class BatchConfig{
	
	@Bean
	public BatchController BatchController() {
		return new BatchController();
	}
	
}