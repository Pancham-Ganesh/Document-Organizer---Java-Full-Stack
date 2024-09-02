package com.pu;

import java.io.*; 

public class Pub_Document {	
	private int doc_id;
	private String doc_Name;
	private String doc_type;
	private String doc_password;
	private String doc_content;
	private String doc_owner;

	public int getDoc_Id() {
		return  doc_id;
     }
	
	public void setDoc_Id(int doc_id) {
		this.doc_id = doc_id; 
    }
	
	public String getDoc_Name() {
		return doc_Name;
    }
	
	public void setDoc_Name(String doc_Name) {
		this.doc_Name = doc_Name;
  	}
	
	public String getDoc_type() {
		return doc_type;
    }
	
	public void setDoc_type(String doc_type) {
		this.doc_type = doc_type;
   	}
	
	public String getDoc_Password() {
		return doc_password;
    }
	
	public void setDoc_Password(String doc_password) {
		this.doc_password = doc_password;
    }
	
	public String getDoc_content() {
		return doc_content;
    }
	
	public void setDoc_content(String doc_content) {
		this.doc_content = doc_content;
  	}
	
	public String getDoc_owner() {
		return doc_owner;
    }
	
	public void setDoc_owner(String doc_owner) {
		this.doc_owner = doc_owner;
    }
	
}
