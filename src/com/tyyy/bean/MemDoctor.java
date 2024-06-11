package com.tyyy.bean;

public class MemDoctor {
    private Long id;
    private long empid;
    public long getEmpid() {
		return empid;
	}

	public void setEmpid(long empid) {
		this.empid = empid;
	}

	@Override
	public String toString() {
		return "MemDoctor [id=" + id + ", doctorName=" + doctorName + ", description=" + description + ", job=" + job
				+ ", imgid=" + imgid + ", jobs=" + jobs + ", shortd=" + shortd + ", flag=" + flag + "]";
	}

	public String getJobs() {
		return jobs;
	}

	public void setJobs(String jobs) {
		this.jobs = jobs;
	}

	public String getShortd() {
		return shortd;
	}

	public void setShortd(String shortd) {
		this.shortd = shortd;
	}

	private String doctorName;

    private String description;

    private String job;
    private String imgid;
    private String jobs;
    private String shortd;
    public String getImgid() {
		return imgid;
	}

	public void setImgid(String imgid) {
		this.imgid = imgid;
	}

	private int flag;
    public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName == null ? null : doctorName.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }
}