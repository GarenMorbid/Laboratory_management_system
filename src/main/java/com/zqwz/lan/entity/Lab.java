package com.zqwz.lan.entity;

public class Lab {
    private int lab_id;

    private String lab_man;

    private String lab_state;

    public int getLab_id() {
        return lab_id;
    }

    public void setLab_id(int lab_id) {
        this.lab_id = lab_id;
    }

    public String getLab_man() {
        return lab_man;
    }

    public void setLab_man(String lab_man) {
        this.lab_man = lab_man;
    }

    public String getLab_state() {
        return lab_state;
    }

    public void setLab_state(String lab_state) {
        this.lab_state = lab_state;
    }

    public Lab(int lab_id, String lab_man, String lab_state) {
        this.lab_id = lab_id;
        this.lab_man = lab_man;
        this.lab_state = lab_state;
    }

    public Lab() {
		super();
		// TODO Auto-generated constructor stub
	}
    
}