package controller.login;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import dao.user.UserDao;
import vo.user.User;

import dao.item.ItemDao;
import vo.item.ItemVo;

public class MyPage extends AbstractController
{
	private ItemDao itemDao;
	private ItemVo itemVo;
	private UserDao userDao;
	private User userVo;
	
	public void setUserDao(UserDao loginDao){this.userDao = loginDao;}
	public void setLoginVo(User userVo){this.userVo = userVo;}	

	public void setItemDao(ItemDao itemDao){this.itemDao = itemDao;}
	public ItemDao getItemDao(){return itemDao;}
	public ItemVo getItemVo(){return itemVo;}
	public void setItemVo(ItemVo itemVo){this.itemVo = itemVo;}
	
	
	public MyPage()
	{}

	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession(true);
		String id=(String) session.getAttribute("userId");
		ModelAndView mav= new ModelAndView();
	  
		HashMap<String, String> tp = new HashMap<String, String>();			
		tp.put("id", id);
	    ArrayList user = (ArrayList)userDao.getLoveList(tp);
	    userVo = (User)user.get(0);
		
		mav.setViewName("Frame");		// ó�� ��� �����ִ� �������� ��Ī
		mav.addObject("userLoveList", userVo.getLoveList());
		mav.addObject("mainUrl", "/MyPage.jsp");

		return mav;
	}

}