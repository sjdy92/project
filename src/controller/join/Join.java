package controller.join;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import vo.user.User;
import dao.user.UserDao;

public class Join extends AbstractController
{
	private UserDao userDao;
	private User userVo;
	
	public Join()
	{}
	
	public void setUserDao(UserDao loginDao)
	{
		this.userDao = loginDao;
	}
	
	public void setLoginVo(User userVo)
	{
		this.userVo = userVo;
	}	
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("Join Controller 실행...");
		
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String phone = request.getParameter("phone");
		String smsyn = request.getParameter("snsyn");
		
		HashMap<String, String> temp = new HashMap<String, String>();			
		temp.put("id", id);
		temp.put("pass", pass);
		temp.put("phone", phone);
		temp.put("smsyn", smsyn);

		userDao.joinSuccess(temp);
		
		ModelAndView mav= new ModelAndView();
		
		mav.setViewName("Frame");		// 처리 결과를 보여주는 페이지의 별칭
		mav.addObject("mainUrl", "/Main.jsp");		// 같이 보낼 녀석.

		return mav;
	}

}
