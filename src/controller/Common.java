package controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.item.ItemDao;
import vo.item.ItemVo;

@Controller
public class Common 
{
	private ItemDao itemDao;
	private ItemVo itemVo;
	
	public Common()
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
	}/*
	 * �ڵ�� jsonView��Ŀ� ���� ������ ���� �ڵ��Դϴ�. Script�ڵ忡�� ����(Controller)�� input�±׿� �Էµ�  id����  ����ϸ�  
	 * Controller������ �ش� �����͸� parameter�� �ް� �� id������ DB�� ��ȸ�մϴ�. ��ȸ��� ������ �ش� ��(DaumDao) 
	 * ��ü�� ModelandView��ü�� addObject�޼ҵ带 ����Ͽ� �־��ְ�, ��ȸ��� ������ null�� �˴ϴ�. 
	 * �׸��� ���������� view���� ��jsonView���� �ϸ� ajax success�Լ� responseData��  ModelandView ��ü�� Json��ü�� �Ľ̵Ǿ �Ѿ�ɴϴ�. 
	 * ��, ModelandView ��ü�� �� ���(Ű,���)���� Person��ü�� �Է��Ͽ����Ƿ� responseData�� �ƴ� responseData.DaumDao�� DaumDao��ü�� �˴ϴ�. 
	 * �Ѿ�� DaumDao ��ü�� json����̱� ������ �Ӽ� ���� data.id, data.name ������ ������ �˴ϴ�.
	 * */
	@RequestMapping("/common/Ajax.do")
	public ModelAndView AjaxView(HttpServletRequest request, HttpServletResponse response)  
	{
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("Ajax Server�� ��� OK");
		String seq = request.getParameter("seq");
		System.out.println("Seq : "+seq);		
		
	    ModelAndView mav= new ModelAndView();
	  
	    HashMap<String, String> temp = new HashMap<String, String>();
	    temp.put("seq", seq);
	    ArrayList addressListAtDaum = (ArrayList)itemDao.addressSelectAtDaum(temp);
	   // ItemVo tempItem = dao.getPerson(id);
	    System.out.println("db ->server OK!");
		if(addressListAtDaum.size()==1){
			System.out.println("seq correctly OK");
			ItemVo tempItem= (ItemVo)addressListAtDaum.get(0);
			
			System.out.println("tempItem inner address is -> : "+tempItem.getAddress());
			//�ϴ� address�� ������ ��� �� db�� ���� ������ ���� �𸣹Ƿ� daum ũ�Ѹ� ���� �Ǿ��ִ°��� �����Ѱ��� �׷��� �̹� string�� �������� ���߿�
			//hash�� ������ ���� ������ ���غ���
	    mav.addObject("DaumDao",tempItem);
		}
		else{
			
			System.out.println("seq irrecorrectly fail...");
		}
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	
}
