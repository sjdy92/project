package controller.join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class IdCheck extends AbstractController
{
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("IdCheck Controller 실행...");

		ModelAndView mav=new ModelAndView();
		mav.setViewName("IdCheck");		// 처리 결과를 보여주는 페이지의 별칭
//		mav.addObject("mainUrl", "/join/Join.jsp");		

		return mav;
	}

}
