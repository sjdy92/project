package dao.item;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class ItemDao 
{
	private SqlMapClientTemplate smct;

	public ItemDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}
	
	@SuppressWarnings("rawtypes")
	public ArrayList addressListAtDaum()
	{
		System.out.println("===============================");
		System.out.println("confirm 매물 업데이트 ");
		return (ArrayList)smct.queryForList("daumData");
	}
	
	public ArrayList addressSelectAtDaum(HashMap temp)
	{
		System.out.println("===============================");
		System.out.println("confirm 매물 업데이트 ");
		return (ArrayList)smct.queryForList("daumSelect",temp);
	}


}
