package com.helper;

public class Helper {

	static public String getFirst10Words(String desc)
	{
		String[] s = desc.split(" ");
		String result = "";
		
		if(s.length < 10) {
			result = desc;
		}
		else
		{
			for(int i=0; i<10; i++)
			{
				result = result + s[i] + " ";
			}
		}
		
		return result+"...";
	}
}
