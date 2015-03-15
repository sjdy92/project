package dao.user;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class UserDao 
{
	private SqlMapClientTemplate smct;
	
	public UserDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}
	
	@SuppressWarnings("rawtypes")
	public ArrayList loginSuccessList(HashMap temp)
	{
		System.out.println("===============================");
		System.out.println("confirm Login Success");
		return (ArrayList)smct.queryForList("confirmLogin", temp);
	}

	public void joinSuccess(HashMap map)
	{
		System.out.println("===============================");
		System.out.println("update Order State");
		smct.update("joinSuccess", map);
	}
	
	public void deleteState(HashMap map)
	{
		System.out.println("===============================");
		System.out.println("delete Order State");
		smct.delete("deleteState", map);
	}
	public void setLoveList(HashMap map)
	{
		System.out.println("===============================");
		System.out.println("set LoveList State");
		smct.update("setLoveList", map);
	}
	public ArrayList getLoveList(HashMap map)
	{
		return (ArrayList)smct.queryForList("getLoveList", map);
	}
	
}
