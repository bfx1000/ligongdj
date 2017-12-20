package com.qf.${packageName}.${objectNameLower}.model;

public class ${objectName}{

<#list fieldList as var>
	
		<#if var[1] == 'Date'>
    private Long ${var[0] };     //${var[2] }
		<#elseif var[1] == 'Integer'>
	private int ${var[0] };  //${var[2] }
		<#else>
	private String ${var[0] };  //${var[2] }
		</#if>
</#list>

}