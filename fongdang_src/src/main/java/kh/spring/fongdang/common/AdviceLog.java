package kh.spring.fongdang.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;



@Component
@Aspect
public class AdviceLog {
	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);
	@Pointcut("execution(public * kh.spring.fongdang..*Dao.*(..))")
	public void daoPointcut() {}

	@Pointcut("execution(public * kh.spring.fongdang..*ServiceImpl.*(..))")
	public void servicePointcut() {}
	
	@Pointcut("execution(public * kh.spring.fongdang..*Controller.*(..))")
	public void controllerPointcut() {}
	
	@Around("daoPointcut()")
	public Object aroundLogMethod(ProceedingJoinPoint pjp) throws Throwable {
		Object ro = null;
		System.out.println("["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
//		logger.info("\t\t["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		// 타겟메소드로 전달되는 매개인자들
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			System.out.print("\t->args["+i+"] "+args[i] +"\n");
//			logger.info("\t\t--args["+i+"] "+args[i]);
		}
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		// 타겟메소드 실행
		ro = pjp.proceed();
		
		stopWatch.stop();
		
		// 타겟메소드의 return 값
		System.out.println("\n\t\t[DAO Ret:"+stopWatch.getTotalTimeMillis()+"ms] "+ ro);
//		logger.info("\t\t[DAO Ret:"+stopWatch.getTotalTimeMillis()+"ms] "+ ro);
		
		return ro;
	}
	
	@Around("controllerPointcut()")
	public Object aroundCtrlLogMethod(ProceedingJoinPoint pjp) throws Throwable {
		Object ro = null;
		System.out.println("["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
//		logger.trace("\t["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		// 타겟메소드로 전달되는 매개인자들
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			System.out.print("\t->args["+i+"] "+args[i] +"\n");
//			logger.info("\t-args["+i+"] "+args[i]);
		}
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		// 타겟메소드 실행
		ro = pjp.proceed();
		
		stopWatch.stop();
		
		// 타겟메소드의 return 값
		System.out.println("\n\t\t[CTRL Ret:"+stopWatch.getTotalTimeMillis()+"ms] "+ ro);
//		logger.trace("\t[CTRL Ret:"+stopWatch.getTotalTimeMillis()+"ms] "+ ro);
		
		return ro;
	}
	
}
