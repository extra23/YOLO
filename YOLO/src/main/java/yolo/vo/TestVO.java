package yolo.vo;

import org.apache.ibatis.type.Alias;

@Alias("Test")
public class TestVO {

	private int moduleId;
	private int startIndex;
	private int cntPerPage;
	
	public TestVO () {}
	
	
	
	
	public TestVO(int moduleId) {
		this.moduleId = moduleId;
	}




	public int getModuleId() {
		return moduleId;
	}
	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public void setCntPerPage(int pageSize) {
		this.cntPerPage = pageSize;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	
	
	
}
