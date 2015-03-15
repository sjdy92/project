package controller.login;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class LogoutSuccess extends AbstractController
{	
	public LogoutSuccess()
	{}
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("====================================");
		System.out.println("LogoutSuccess Controller ����...");		
		
		ModelAndView mav=new ModelAndView();	
		HttpSession session = request.getSession(true);
	
		session.setAttribute("loginYn", "N");
		session.setAttribute("adminYn", "N");
		session.setAttribute("userState", "logout");
		session.removeAttribute("userId");
			
		mav.setViewName("Frame");
		mav.addObject("mainUrl", "/Main.jsp");			

		return mav;
	}
}