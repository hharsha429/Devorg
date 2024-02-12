public  class DynamicSchema {
	public Map<String,Schema.SobjectType> objMap;
	public Map<String,Schema.SobjectField> fldMap;
	public List<SelectOption> objects {set;get;}
	public List<SelectOption> 				nsoptions	{set;get;}
	public List<SelectOption> 				soptions	{set;get;}
	public Set<String> 					nsfields	{set;get;}
	public Set<string> 					sfields		{set;get;}
	public List<String> 					selected 	{set;get;}
	public List<String> 					removed 	{set;get;}
	public String 							objselected	{set;get;}
	public DynamicSchema(){
		objects=new List<SelectOption>();
		nsoptions=new List<SelectOption>();
		soptions=new List<SelectOption>();
		nsfields=new Set<String>();
		sfields=new Set<String>();
		selected=new List<String>();
		removed=new List<String>();
		objMap=Schema.getGlobalDescribe();
		Set<String> keys=objMap.keySet();
		SelectOption p=new SelectOption('none','-None-');
		objects.add(p);
		for(String s:keys){
	Schema.DescribeSobjectResult result=objMap.get(s).getDescribe();
			if(result.isCustom()){
				SelectOption op=new SelectOption(s,s);
				objects.add(op);
			}
		}
	}
	public void getFields(){
   Schema.DescribeSobjectResult result=objMap.get(objselected).getDescribe();
		fldMap=result.fields.getMap();
		Set<String> keys=fldmap.keySet();
		nsfields.addAll(keys);
		createOptions();
	}
	public void createOptions(){
		 nsoptions.clear();
		 soptions.clear();
		 for(String s1:nsfields){
		 	selectoption op1=new SelectOption(s1,s1);
		 	nsoptions.add(op1);
		 }
		 for(String s2:sfields){
		 	SelectOption op2=new SelectOption(s2,s2);
		 	soptions.add(op2);
		 }
	}
	public void addFields(){
		nsfields.removeAll(selected);
		sfields.addAll(selected);
		createOptions();
	}
	public void removeFields(){
		nsfields.addAll(removed);
		sfields.removeAll(removed);
		createOptions();
	}
}