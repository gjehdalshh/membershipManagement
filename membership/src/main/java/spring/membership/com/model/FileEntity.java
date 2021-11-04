package spring.membership.com.model;

public class FileEntity {
	private int i_file;
	private int i_channel;
	private int i_user;
	private String fileName;
	private int fileLength;
	private String fileData;
	public int getI_file() {
		return i_file;
	}
	public void setI_file(int i_file) {
		this.i_file = i_file;
	}
	public int getI_channel() {
		return i_channel;
	}
	public void setI_channel(int i_channel) {
		this.i_channel = i_channel;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileLength() {
		return fileLength;
	}
	public void setFileLength(int fileLength) {
		this.fileLength = fileLength;
	}
	public String getFileData() {
		return fileData;
	}
	public void setFileData(String fileData) {
		this.fileData = fileData;
	}
	
	
}
