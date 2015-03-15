package controller.login;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.user.UserDao;
import vo.user.User;
import dao.item.ItemDao;
import vo.item.ItemVo;

public class LoveList {
	private ItemDao itemDao;
	private ItemVo itemVo;
	private UserDao userDao;
	private User userVo;
	
	public LoveList(){}
	
	public void setUserDao(UserDao loginDao){this.userDao = loginDao;}
	public void setLoginVo(User userVo){this.userVo = userVo;}	

	public void setItemDao(ItemDao itemDao){this.itemDao = itemDao;}
	public ItemDao getItemDao(){return itemDao;}
	public ItemVo getItemVo(){return itemVo;}
	public void setItemVo(ItemVo itemVo){this.itemVo = itemVo;}
	
	
	@RequestMapping("/lovelist/set.do")
	public ModelAndView setLoveList(HttpServletRequest request, HttpServletResponse response)  
	{
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("Ajax Server:: LoveList OK");
		String seq = request.getParameter("seq");
		System.out.println("Seq : "+seq);		
		
		HttpSession session = request.getSession(true);
		String id=(String) session.getAttribute("userId");
		ModelAndView mav= new ModelAndView();
	  
		HashMap<String, String> tp = new HashMap<String, String>();			
		tp.put("id", id);
	    ArrayList loveList = (ArrayList)userDao.getLoveList(tp);
	    
	    userVo=(User) loveList.get(0);
	    
	    if(!userVo.getLoveList().contains(seq))
	    {	
	    	if(!userVo.getLoveList().equals("(null)"))seq =seq+','+ userVo.getLoveList();
	    }
		else{seq = userVo.getLoveList();}
	    
		HashMap<String, String> temp = new HashMap<String, String>();			
		temp.put("seq", seq);
		temp.put("id",id );
		userDao.setLoveList(temp);
		System.out.println("셋 찜~!");
	    mav.setViewName("jsonView");
	    return mav;
	}
	
}
