package net.ourams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/main")
public class MyMainPageControllder {

	
	@RequestMapping(value = "/index")
	public String mainPage(
			Model model) {
		System.out.println("start main");
		
		return "main/index";
	}
	

	@RequestMapping(value = "/indexforstudent")
	public String indexforstudent(
			Model model) {
		System.out.println("start main for student");
		
		return "main/indexForStudent";
	}
	

	@RequestMapping(value = "/editForm")
	public String editForm() {
		System.out.println("start main");
		
		return "main/editForm";
	}
	
	
}
