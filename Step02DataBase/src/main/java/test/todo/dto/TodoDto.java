package test.todo.dto;

public class TodoDto {
	private int num;
	private String work;
	private String addr;
	
	public TodoDto() {}

	public TodoDto(int num, String work, String addr) {
		super();
		this.num = num;
		this.work = work;
		this.addr = addr;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
}