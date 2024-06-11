package com.tyyy.bean;

import java.util.Date;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2016年12月29日 上午10:22:36 
 * @version 1.0 
*/
public class Sign {
	    private Long id;

	    private long memId;
	    
	    private String mem_name;

	    private Date signTime;

	    private Integer deleteFlag;

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public long getMemId() {
			return memId;
		}

		public void setMemId(long memId) {
			this.memId = memId;
		}

		public String getMem_name() {
			return mem_name;
		}

		public void setMem_name(String mem_name) {
			this.mem_name = mem_name;
		}

		public Date getSignTime() {
			return signTime;
		}

		public void setSignTime(Date signTime) {
			this.signTime = signTime;
		}

		public Integer getDeleteFlag() {
			return deleteFlag;
		}

		public void setDeleteFlag(Integer deleteFlag) {
			this.deleteFlag = deleteFlag;
		}

		@Override
		public String toString() {
			return "Sign [id=" + id + ", memId=" + memId + ", mem_name=" + mem_name + ", signTime=" + signTime
					+ ", deleteFlag=" + deleteFlag + "]";
		}




}
