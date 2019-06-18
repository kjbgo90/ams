package net.ourams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/main")
public class MyMainPageControllder {

	
	@RequestMapping(value = "/index")
	public String mainPage() {
		System.out.println("start main");
		return "main/index";
	}
}
