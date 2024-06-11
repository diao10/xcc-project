package com.tyyy.bean;

public class Power {
    private Long pid;
    private String powerName;
    private Integer powerType;
    private Long superId;
    private String url;

    public String getPowerName() {
        return powerName;
    }

    public void setPowerName(String powerName) {
        this.powerName = powerName == null ? null : powerName.trim();
    }

    public Integer getPowerType() {
        return powerType;
    }

    public void setPowerType(Integer powerType) {
        this.powerType = powerType;
    }

    public Long getSuperId() {
        return superId;
    }

	public void setSuperId(Long superId) {
		this.superId = superId;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "Power [pid=" + pid + ", powerName=" + powerName + ", powerType=" + powerType + ", superId=" + superId
				+ ", url=" + url + "]";
	}

    
}