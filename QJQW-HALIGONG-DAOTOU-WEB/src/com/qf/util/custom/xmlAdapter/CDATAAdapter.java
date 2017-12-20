package com.qf.util.custom.xmlAdapter;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class CDATAAdapter extends XmlAdapter<String, String> {

	private static final String CDATA_PREFIX = "<![CDATA[";
	private static final String CDATA_SUFFIX = "]]>";
	@Override
	public String unmarshal(String v) throws Exception {
		try {
			return v.substring(CDATA_PREFIX.length() - 1, v.length() - CDATA_SUFFIX.length() - 1);
		} catch (Exception e) {
			
		}
		return v;
	}

	@Override
	public String marshal(String v) throws Exception {
		return CDATA_PREFIX + v + CDATA_SUFFIX;
	}

}
