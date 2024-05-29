package com.demo.entities;

import org.json.JSONObject;

public class ThoiKhoaBieu {
        private int id;
        private Object thu2, thu3, thu4, thu5, thu6;
        private int idLopHoc;
        private String buoi;
        private int buoiHoc;
        private String thu2Ne, thu3Ne, thu4Ne, thu5Ne, thu6Ne;

		public int getId() {
			return id;
		}
		
		public ThoiKhoaBieu(Object thu2, Object thu3, Object thu4, Object thu5, Object thu6) {
			super();
			this.thu2 = thu2;
			this.thu3 = thu3;
			this.thu4 = thu4;
			this.thu5 = thu5;
			this.thu6 = thu6;
		}

		public ThoiKhoaBieu() {
			// TODO Auto-generated constructor stub
		}

		public String getThu2Ne() {
			return thu2Ne;
		}

		public void setThu2Ne(String thu2Ne) {
			this.thu2Ne = thu2Ne;
		}

		public String getThu3Ne() {
			return thu3Ne;
		}

		public void setThu3Ne(String thu3Ne) {
			this.thu3Ne = thu3Ne;
		}

		public String getThu4Ne() {
			return thu4Ne;
		}

		public void setThu4Ne(String thu4Ne) {
			this.thu4Ne = thu4Ne;
		}

		public String getThu5Ne() {
			return thu5Ne;
		}

		public void setThu5Ne(String thu5Ne) {
			this.thu5Ne = thu5Ne;
		}

		public String getThu6Ne() {
			return thu6Ne;
		}

		public void setThu6Ne(String thu6Ne) {
			this.thu6Ne = thu6Ne;
		}

		public int getBuoiHoc() {
			return buoiHoc;
		}

		public void setBuoiHoc(int buoiHoc) {
			this.buoiHoc = buoiHoc;
		}

		public void setId(int id) {
			this.id = id;
		}
		public Object getThu2() {
			return thu2;
		}
		public void setThu2(Object thu2) {
			this.thu2 = thu2;
		}
		public Object getThu3() {
			return thu3;
		}
		public void setThu3(Object thu3) {
			this.thu3 = thu3;
		}
		public Object getThu4() {
			return thu4;
		}
		public void setThu4(Object thu4) {
			this.thu4 = thu4;
		}
		public Object getThu5() {
			return thu5;
		}
		public void setThu5(Object thu5) {
			this.thu5 = thu5;
		}
		public Object getThu6() {
			return thu6;
		}
		public void setThu6(Object thu6) {
			this.thu6 = thu6;
		}
		public int getIdLopHoc() {
			return idLopHoc;
		}
		public void setIdLopHoc(int idLopHoc) {
			this.idLopHoc = idLopHoc;
		}
		public String getBuoi() {
			return buoi;
		}
		public void setBuoi(String buoi) {
			this.buoi = buoi;
		}
		public JSONObject getThuJson(int thu) {
	        switch (thu) {
	            case 2:
	                return new JSONObject((String) thu2);
	            case 3:
	                return new JSONObject((String) thu3);
	            case 4:
	                return new JSONObject((String) thu4);
	            case 5:
	                return new JSONObject((String) thu5);
	            case 6:
	                return new JSONObject((String) thu6);
	            default:
	                return null;
	        }
	    }

	    @Override
	    public String toString() {
	        return "ThoiKhoaBieu{" +
	                "id=" + id +
	                ", thu2=" + thu2 +
	                ", thu3=" + thu3 +
	                ", thu4=" + thu4 +
	                ", thu5=" + thu5 +
	                ", thu6=" + thu6 +
	                ", idLopHoc=" + idLopHoc +
	                ", buoi='" + buoi + '\'' +
	                '}';
	    }
}
