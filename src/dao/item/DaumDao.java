package dao.item;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class DaumDao 
{
	private SqlMapClientTemplate smct;

	public DaumDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}
	

	public ArrayList getAddress()
	{
		System.out.println("===============================");
		System.out.println("get Address");
		return (ArrayList)smct.queryForList("getAddress");
	}

}
