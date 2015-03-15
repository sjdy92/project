package controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;


public class Main extends AbstractController
{
	public Main()
	{}

	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("Main page ����...");		

		ModelAndView mav=new ModelAndView();

		mav.setViewName("Frame");		// ó�� ����� �����ִ� �������� ��Ī
		mav.addObject("mainUrl", "/Main.jsp");

		return mav;
	}

}
