package controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;


public class Reg_Room extends AbstractController
{
	public Reg_Room()
	{}

	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("Main page ����...");		

		ModelAndView mav=new ModelAndView();
		mav.setViewName("reg_room/Reg_Room");		// ó�� ����� �����ִ� �������� ��Ī

		return mav;
	}

}
