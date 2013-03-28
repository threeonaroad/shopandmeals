package com.app.shopandmeals.models.binders;

import java.beans.PropertyEditorSupport;


public class NombreMayusculaEditor extends PropertyEditorSupport {

	@Override
	public void setAsText(String text) {
		
		if (text == null) {
			setValue(null);
		}
		else {
			String value = text.toUpperCase();
			setValue(value);
			/*String[] tags = getTags();
			for (int i = 0; i < tags.length; i++) {
				if (tags[i].equals("nombre") || tags[i].equals("nombre"))  {
					

				}
								
			}*/
			
		}
	}
}
