package com.tyyy.bean;

public class Fz {
    private String id;

    private String cd;

    @Override
	public String toString() {
		return "Fz [id=" + id + ", cd=" + cd + ", deleteFlag=" + deleteFlag + ", filed1=" + filed1 + ", filed2="
				+ filed2 + ", filed3=" + filed3 + "]";
	}

	private Integer deleteFlag;

    private String filed1;

    private String filed2;

    private String filed3;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCd() {
        return cd;
    }

    public void setCd(String cd) {
        this.cd = cd;
    }

    public Integer getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Integer deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public String getFiled1() {
        return filed1;
    }

    public void setFiled1(String filed1) {
        this.filed1 = filed1 == null ? null : filed1.trim();
    }

    public String getFiled2() {
        return filed2;
    }

    public void setFiled2(String filed2) {
        this.filed2 = filed2 == null ? null : filed2.trim();
    }

    public String getFiled3() {
        return filed3;
    }

    public void setFiled3(String filed3) {
        this.filed3 = filed3 == null ? null : filed3.trim();
    }
}