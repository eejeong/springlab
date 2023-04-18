package com.kbstar.app;
import com.kbstar.frame.*;
import com.kbstar.tv.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
    public static void main(String args[]){
        ApplicationContext factory =
                new ClassPathXmlApplicationContext("spring.xml");
        // TV tv1 = new STV();
        TV tv = (TV) factory.getBean("ltv");
        tv.turnOn();

    }
}
