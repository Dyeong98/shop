package kr.co.lnssoft;

import org.springframework.scheduling.annotation.Scheduled;

public class BatchController{
	
	//�� �� �� �� �� ����
	@Scheduled(cron="* * * * * 1")
	public void testBatchGo() {
	}
}