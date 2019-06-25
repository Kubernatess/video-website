package bean;

import java.sql.Time;
import java.sql.Timestamp;

public class Video {
	private String author;
	private String videoName;
	private Timestamp uploadDate;
	private String description;
	private String praiseNumber;
	private byte[] size;
	private String duration;
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getVideoName() {
		return videoName;
	}
	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}
	public Timestamp getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Timestamp uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPraiseNumber() {
		return praiseNumber;
	}
	public void setPraiseNumber(String praiseNumber) {
		this.praiseNumber = praiseNumber;
	}
	public byte[] getSize() {
		return size;
	}
	public void setSize(byte[] size) {
		this.size = size;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	
}
