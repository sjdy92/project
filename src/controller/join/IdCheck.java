package controller.join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class IdCheck extends AbstractController
{
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("IdCheck Controller ����...");

		ModelAndView mav=new ModelAndView();
		mav.setViewName("IdCheck");		// ó�� ����� �����ִ� �������� ��Ī
//		mav.addObject("mainUrl", "/join/Join.jsp");		

		return mav;
	}

}
