package controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import vo.item.ItemVo;
import dao.item.ItemDao;


public class Item extends AbstractController
{
	private ItemDao itemDao;
	private ItemVo itemVo;
	
	public Item()
	{}

	public void setItemDao(ItemDao itemDao)
	{
		this.itemDao = itemDao;
	}
	public ItemDao getItemDao(){
		return itemDao;
	}
	public ItemVo getItemVo(){
		return itemVo;
	}
	
	public void setItemVo(ItemVo itemVo)
	{
		this.itemVo = itemVo;
	}
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("Item page 가기...");		
		
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		System.out.println(lat+" "+lng);

		HttpSession session = request.getSession(true);
		session.setAttribute("lat", lat);
		session.setAttribute("lng", lng);
	
		HashMap<String,String> addressHash = new HashMap<String,String>();
		
		
		ArrayList addressListAtDaum = (ArrayList)itemDao.addressListAtDaum();
		for(int i=0;i<10;i++){
			ItemVo temp= (ItemVo)addressListAtDaum.get(i);
			System.out.println(temp.getSeq()+" "+temp.getAddress());
			addressHash.put(temp.getSeq(),temp.getAddress());
		}
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("Frame");		// 처리 결과를 보여주는 페이지의 별칭
		mav.addObject("mainUrl", "/Item.jsp");
		mav.addObject("addressHash",addressHash);
		
		return mav;
	}

}
