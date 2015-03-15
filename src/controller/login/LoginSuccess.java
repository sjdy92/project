package controller.login;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import vo.user.User;
import dao.user.UserDao;

public class LoginSuccess extends AbstractController
{
	private UserDao userDao;
	private User userVo;
	
	public LoginSuccess()
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
		System.out.println("====================================");
		System.out.println("LoginSuccess Controller ����...");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String returnURL = request.getParameter("returnURL");
		System.out.println(returnURL);
		HashMap<String, String> temp = new HashMap<String, String>();			
		temp.put("id", id);
		temp.put("pass", pass);
	
		ModelAndView mav=new ModelAndView();
		
		ArrayList loginInfo = (ArrayList)userDao.loginSuccessList(temp);
		
		if(loginInfo.size() > 0)
		{
			userVo = (User)loginInfo.get(0);
	//		String adminYn = userVo.getAdminYn();
			String userId = userVo.getId();
			
			HttpSession session = request.getSession(true);
			session.setAttribute("loginYn", "Y");
			session.setAttribute("userState", "login");
	//		session.setAttribute("adminYn", adminYn);
			session.setAttribute("userId", userId);
			
			mav.setViewName("Frame");
			mav.addObject("mainUrl", "/Main.jsp");
			mav.addObject("loginInfo", loginInfo);
		}
		else
		{

			HttpSession session = request.getSession(true);
			session.setAttribute("loginYn", "N");
			session.setAttribute("userState", "No");
//			request.setAttribute("code", "-1");
			
			mav.setViewName("Frame");
			mav.addObject("mainUrl", "/Main.jsp");			
		}

		return mav;
	}
}