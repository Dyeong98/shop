package kr.co.lnssoft;

import org.springframework.scheduling.annotation.Scheduled;

public class BatchController{
	
	//초 분 시 일 월 요일
	@Scheduled(cron="* * * * * 1")
	public void testBatchGo() {
	}
}